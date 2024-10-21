import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'package:ulip_app2/screens/dashboard.dart';
import 'package:ulip_app2/screens/data_integration.dart';
import 'package:ulip_app2/screens/home.dart';
import 'package:ulip_app2/screens/notifications.dart';
import 'package:ulip_app2/screens/predictive.dart';
import 'package:ulip_app2/screens/reports.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng Bengarulu = LatLng(12.9716, 77.5946);

  BitmapDescriptor? customIcon;
  Set<Marker> markers = {};
  List<dynamic> vehicles = [];
  List<dynamic> filteredVehicles = [];
  TextEditingController searchController = TextEditingController();
  bool showDropdown = false; // State variable to control dropdown visibility
  dynamic selectedVehicle; // State variable to store selected vehicle

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
    _loadVehicleData();
    searchController.addListener(_filterVehicles);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _loadCustomMarker() async {
  try {
    print('Loading custom marker'); // Debug line
    final BitmapDescriptor markerIcon = await _createCustomMarkerBitmap('assets/truck_1.png', 100);
    print('Custom marker loaded'); // Debug line after loading
    setState(() {
      customIcon = markerIcon;
    });
    // Reload the vehicle data after the icon is loaded
    _loadVehicleData();
  } catch (e) {
    print('Error loading custom marker: $e'); // Error print statement
  }
}


  Future<BitmapDescriptor> _createCustomMarkerBitmap(String imagePath, int size) async {
    final ByteData data = await rootBundle.load(imagePath);
    final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: size, targetWidth: size);
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..isAntiAlias = true;
    canvas.drawImage(fi.image, Offset.zero, paint);
    final ui.Image resizedImage = await pictureRecorder.endRecording().toImage(size, size);
    final ByteData? byteData = await resizedImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List resizedBytes = byteData!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(resizedBytes);
  }

  Future<void> _loadVehicleData() async {
    String data = await rootBundle.loadString('assets/vehicle_data_bengaluru.json');
    final List<dynamic> vehicleList = json.decode(data);
    setState(() {
      vehicles = vehicleList;
      filteredVehicles = vehicleList; // Initially, all vehicles are shown
    });
    _updateMarkers();
  }

  void _updateMarkers() {
    Set<Marker> newMarkers = filteredVehicles.map((vehicle) {
      final LatLng position = LatLng(vehicle['current_location']['latitude'], vehicle['current_location']['longitude']);
      return Marker(
        markerId: MarkerId(vehicle['vehicle_id']),
        position: position,
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'Vehicle ID: ${vehicle['vehicle_id']}',
          snippet: 'Departure: ${vehicle['departure_location']}\nArrival: ${vehicle['arrival_location']}',
          onTap: () {
            _showVehicleDetails(vehicle);
          },
        ),
      );
    }).toSet();

    setState(() {
      markers = newMarkers;
    });
  }

  void _filterVehicles() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredVehicles = vehicles.where((vehicle) =>
          vehicle['vehicle_id'].toLowerCase().contains(query)).toList();
      showDropdown = filteredVehicles.isNotEmpty; // Show dropdown if there are results
    });
    _updateMarkers();
  }

  void _showVehicleDetails(dynamic vehicle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vehicle ID: ${vehicle['vehicle_id']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Starting Time: ${vehicle['starting_time']}'),
              Text('Departure: ${vehicle['departure_location']}'),
              Text('Arrival: ${vehicle['arrival_location']}'),
              Text('Current Location: ${vehicle['current_location']['latitude']}, ${vehicle['current_location']['longitude']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _clearSearch() {
    searchController.clear();
    setState(() {
      filteredVehicles = vehicles; // Reset the filtered list to show all vehicles
      showDropdown = false; // Hide the dropdown
      selectedVehicle = null; // Clear selected vehicle
    });
    _updateMarkers();
  }

  void _selectVehicle(dynamic vehicle) {
    setState(() {
      selectedVehicle = vehicle; // Set the selected vehicle
      showDropdown = false; // Hide the dropdown after selection
      searchController.text = vehicle['vehicle_id']; // Set the search text to selected vehicle ID
    });
    _updateMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      toolbarHeight: 80,
      title:const Padding(
        padding:  EdgeInsets.only(left: 110), // Adjust this value for more left/right
        child: Text(
          'ULIP',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 113,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Overt Ideas ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading:const Icon(Icons.home),
              title:const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                // Redirect to the Dashboard page if clicked
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Predictive Analytics'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Predictive()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.data_usage),
              title: Text('Data Integration'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DataIntegration()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Reports'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Reports()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.gps_fixed),
              title: const Text('Tracking'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search by Vehicle ID',
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              setState(() {
                                showDropdown = true; // Show dropdown on search icon click
                              });
                              _filterVehicles(); // Trigger filtering
                            },
                          ),
                          if (searchController.text.isNotEmpty)
                            IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: _clearSearch, // Clear search and hide dropdown
                            ),
                        ],
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: Bengarulu,
                zoom: 13,
              ),
              markers: markers,
            ),
          ),
          if (showDropdown)
            Expanded(
            child: ListView.builder(
              itemCount: filteredVehicles.length,
              itemBuilder: (context, index) {
                final vehicle = filteredVehicles[index];
                return ListTile(
                  title: Text('Vehicle ID: ${vehicle['vehicle_id']}'),
                  onTap: () {
                    _selectVehicle(vehicle); // Set selected vehicle and hide dropdown
                  },
                  subtitle: selectedVehicle != null // Use a conditional expression here
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Starting Time: ${selectedVehicle['starting_time']}'),
                              Text('Departure: ${selectedVehicle['departure_location']}'),
                              Text('Arrival: ${selectedVehicle['arrival_location']}'),
                              Text('Current Location: ${selectedVehicle['current_location']['latitude']}, ${selectedVehicle['current_location']['longitude']}'),
                            ],
                          ),
                        )
                      : null, // If selectedVehicle is null, show nothing
                );
              },
            ),
          ),

          // Show selected vehicle details only if a vehicle is selected
          
          if (!showDropdown && filteredVehicles.isEmpty)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('No vehicles found'),
            ),
        ],
      ),
    );
  }
}
