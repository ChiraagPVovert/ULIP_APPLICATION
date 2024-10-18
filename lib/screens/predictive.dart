import 'package:flutter/material.dart';
import 'package:ulip_app2/screens/dashboard.dart';
import 'package:ulip_app2/screens/data_integration.dart';
import 'package:ulip_app2/screens/home.dart';
import 'package:ulip_app2/screens/map_page.dart';
import 'package:ulip_app2/screens/notifications.dart';
import 'package:ulip_app2/screens/reports.dart';

class Predictive extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Predictive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child: Text('ULIP',
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
              title: const Text('Traking'),
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
      body:const Padding(
        padding:  EdgeInsets.all(16.0), // Add padding for content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Predictive Analytics', // Subtitle
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10), // Space between title and subtitle
            Text(
              '• Predictive Demand Forecasting Graphs',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              ' Display visually intuitive graphs that show predictions for upcoming shipments and peak demand periods based on historical data. This helps logistics managers plan resources and staffing in advance, optimizing operations during high-demand times.',
            ),
            SizedBox(height: 15),


            Text(
              '• Suggested Optimized Routes',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Provide route optimization suggestions for specific deliveries, taking into account factors like distance, traffic patterns, and delivery urgency. This feature helps reduce travel time and fuel consumption, improving the efficiency of the delivery process.',
            ),
            SizedBox(height: 15),

            Text(
              '• Inventory Management Insights',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Offer insights into current stock levels, along with predictions for upcoming demand. This allows logistics teams to manage inventory more effectively, ensuring the right products are available when needed without overstocking.',
            ),
            SizedBox(height: 15),

            Text(
              '• ML-Driven Recommendations',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Generate recommendations for optimal shipment schedules and fleet utilization. By analyzing patterns in the data, the system suggests the best times to dispatch vehicles and the most efficient use of the fleet, maximizing operational efficiency.',
            ),
            
          ],
        ),
      ),
    );
  }
}
