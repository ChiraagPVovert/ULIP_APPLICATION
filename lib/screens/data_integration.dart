import 'package:flutter/material.dart';
import 'package:ulip_app2/screens/dashboard.dart';
import 'package:ulip_app2/screens/home.dart';
import 'package:ulip_app2/screens/map_page.dart';
import 'package:ulip_app2/screens/notifications.dart';
import 'package:ulip_app2/screens/predictive.dart';
import 'package:ulip_app2/screens/reports.dart';

class DataIntegration extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DataIntegration> {
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
      body:const Padding(
        padding:  EdgeInsets.all(16.0), // Add padding for content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Data Integration', // Subtitle
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10), // Space between title and subtitle
            Text(
              '• Connect New Data Sources',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              ' Provide an interface for admins to easily integrate various data sources such as APIs, IoT devices, and CSV file uploads. This feature ensures flexibility in connecting a wide range of data inputs critical to logistics operations, ensuring comprehensive data collection.',
            ),
            SizedBox(height: 15),


            Text(
              '• Validate and Standardize Incoming Data',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Implement tools to validate and standardize incoming data from different sources, ensuring data accuracy and consistency. This feature ensures that all data adheres to a common format, allowing for seamless integration and analysis.',
            ),
            SizedBox(height: 15),

            Text(
              '• Schedule Regular Data Refreshes',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Allow admins to configure the frequency of data updates, whether daily, weekly, or on a more frequent schedule. This feature ensures that the system is continuously updated with the latest data, providing accurate insights for decision-making.',
            ),
            SizedBox(height: 15),

            Text(
              '• Status Indicators for Data Connections',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Display clear status indicators showing whether data connections are active or inactive. This feature helps admins quickly identify any connection issues or failures, ensuring smooth operation and timely troubleshooting.',
            ),
            
          ],
        ),
      ),
    );
  }
}
