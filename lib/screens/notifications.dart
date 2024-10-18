
import 'package:flutter/material.dart';
import 'package:ulip_app2/screens/dashboard.dart';
import 'package:ulip_app2/screens/data_integration.dart';
import 'package:ulip_app2/screens/home.dart';
import 'package:ulip_app2/screens/map_page.dart';
import 'package:ulip_app2/screens/predictive.dart';
import 'package:ulip_app2/screens/reports.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                'Notifications', // Subtitle
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10), // Space between title and subtitle
            Text(
              '• View Real-Time Notifications',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Provide a user-friendly interface to display real-time notifications regarding critical issues such as route disruptions, vehicle breakdowns, and shipment delays. This feature ensures that logistics teams are promptly informed of operational challenges, enabling swift response and mitigation strategies.',
            ),
            SizedBox(height: 15),


            Text(
              '• Set Custom Alerts',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Allow users to create customized alerts based on specific criteria, such as notifying them when a delivery is late by more than one hour. This feature enables logistics managers to focus on the most pressing issues that could impact service levels and operational efficiency.',
            ),
            SizedBox(height: 15),

            Text(
              '• Log of Historical Alerts and Resolved Incidents',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Maintain a comprehensive log of past alerts and resolved incidents, providing users with visibility into recurring issues and the effectiveness of previous interventions. This feature helps in analyzing trends over time and identifying areas for improvement.',
            ),
            SizedBox(height: 15),

            Text(
              '• Integrate with Email/SMS for Important Alerts',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Facilitate integration with email and SMS services to ensure that critical alerts reach users instantly. This feature enhances communication and ensures that important notifications are not missed, even when users are not actively monitoring the dashboard.',
            ),
            
          ],
        ),
      ),
    );
  }
}
