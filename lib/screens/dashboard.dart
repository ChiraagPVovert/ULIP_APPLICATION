import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart package for pie chart
import 'package:flutter/services.dart' show rootBundle; // To read file
import 'package:csv/csv.dart'; // Import csv package
import 'package:ulip_app2/screens/data_integration.dart';
import 'package:ulip_app2/screens/home.dart';
import 'package:ulip_app2/screens/map_page.dart';
import 'package:ulip_app2/screens/notifications.dart';
import 'package:ulip_app2/screens/predictive.dart';
import 'package:ulip_app2/screens/reports.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, int> statusCount = {};

  @override
  void initState() {
    super.initState();
    loadCsvData();
  }

  Future<void> loadCsvData() async {
    final data = await rootBundle.loadString('assets/shipment_status_data.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
    print(csvTable); // Debugging line

    // Skip the header row and populate the statusCount map
    for (var i = 1; i < csvTable.length; i++) {
      String status = csvTable[i][1]; // Change to 1 for the Status column
      statusCount[status] = (statusCount[status] ?? 0) + 1; // Count occurrences
    }

    print(statusCount); // Debugging line to check statusCount map

    // Refresh the UI after loading data
    setState(() {});
  }

  Widget buildPieChart(Map<String, int> statusCount) {
    double total = statusCount.values.fold(0, (sum, value) => sum + value);

    return PieChart(
      PieChartData(
        sections: statusCount.entries.map((entry) {
          final double percentage = (entry.value / total) * 100;
          return PieChartSectionData(
            value: entry.value.toDouble(),
            title: '${entry.key}\n${percentage.toStringAsFixed(1)}%', // Display percentage
            color: getColorForStatus(entry.key), // Dynamic color based on status
            radius: 70, // Adjust the size of the pie chart sections
            titleStyle:const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        }).toList(),
        centerSpaceRadius: 50, // Adjust the center space radius
        borderData: FlBorderData(show: false),
      ),
    );
  }

  Color getColorForStatus(String status) {
    switch (status) {
      case 'In Transit':
        return Colors.blue;
      case 'Delivered':
        return Colors.green;
      case 'Delayed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsets.only(left: 110), // Adjust this value for more left/right
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
              child:const DrawerHeader(
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
              leading: const Icon(Icons.home),
              title: const Text('Home'),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Dashboard', // Subtitle
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10), // Space between title and subtitle

              Text(
                '• Shipment Status Filters',
                style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
              ),
              SizedBox(height: 5), // Adds space between widgets
              Text(
                'Provide users with the ability to filter shipments based on their current status, such as "In Transit," "Delivered," or "Delayed." This feature simplifies tracking by categorizing shipments, helping logistics managers prioritize and focus on specific operations.',
              ),
              SizedBox(height: 15),

              // Insert pie chart here
              SizedBox(
                height: 250, // Adjust the height of the pie chart
                child: buildPieChart(statusCount),
              ),

              SizedBox(height: 15), // Space between chart and next section
              
              Text(
                '• Key Shipment Metrics',
                style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
              ),
              SizedBox(height: 5), // Adds space between widgets
              Text(
                'Display essential metrics, including the total number of shipments, estimated delivery times, and average delays. These metrics give users a clear overview of the logistics performance, helping them assess operational efficiency and identify areas for improvement.',
              ),
              SizedBox(height: 15),

              Text(
                '• Alerts for Operational Issues',
                style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
              ),
              SizedBox(height: 5), // Adds space between widgets
              Text(
                'Incorporate an alert system to notify users about potential disruptions in logistics, such as route delays, vehicle breakdowns, or other unforeseen issues. Early warnings allow logistics teams to take corrective actions promptly, minimizing the impact on delivery schedules.',
              ),
              SizedBox(height: 15),

              Text(
                '• Detailed Shipment Information',
                style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
              ),
              SizedBox(height: 5), // Adds space between widgets
              Text(
                'Offer detailed views for individual shipments, showing relevant data like origin, destination, current location, and expected delivery time. This feature ensures users have all the information needed to track and manage shipments effectively.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
