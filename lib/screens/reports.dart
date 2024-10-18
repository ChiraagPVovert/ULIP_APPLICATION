
import 'package:flutter/material.dart';
import 'package:ulip_app2/screens/dashboard.dart';
import 'package:ulip_app2/screens/data_integration.dart';
import 'package:ulip_app2/screens/home.dart';
import 'package:ulip_app2/screens/map_page.dart';
import 'package:ulip_app2/screens/predictive.dart';
import 'package:ulip_app2/screens/notifications.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
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
                'Reports', // Subtitle
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10), // Space between title and subtitle
            Text(
              '• Generate Custom Reports',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Enable users to create personalized reports on various logistics metrics such as delivery efficiency, fuel consumption, and shipment delays. This feature allows users to tailor reports to their specific needs, providing targeted insights for improving operations.',
            ),
            SizedBox(height: 15),


            Text(
              '• AI-Powered Natural Language Queries',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Integrate AI-powered tools (using technologies like OpenAI/Gemini via LangChain) that allow users to ask questions in natural language and receive data-driven insights. This feature simplifies access to complex data, making it easy for users to query and analyze logistics performance without technical expertise.',
            ),
            SizedBox(height: 15),

            Text(
              '• Export Reports in PDF or CSV Format',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Provide options to export generated reports in PDF or CSV format for sharing, documentation, or further analysis. This feature ensures that users can store and distribute insights in widely accepted formats for use in presentations or external audits.',
            ),
            SizedBox(height: 15),

            Text(
              '• Historical Trends and KPIs',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Display historical performance trends and key performance indicators (KPIs), giving users a clear view of logistics performance over time. This feature helps identify long-term patterns and assess the effectiveness of operational strategies.',
            ),
            
          ],
        ),
      ),
    );
  }
}
