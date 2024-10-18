import 'package:flutter/material.dart';
import 'package:ulip_app2/screens/dashboard.dart';
import 'package:ulip_app2/screens/data_integration.dart';
import 'package:ulip_app2/screens/map_page.dart';
import 'package:ulip_app2/screens/notifications.dart';
import 'package:ulip_app2/screens/predictive.dart';
import 'package:ulip_app2/screens/reports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

            SizedBox(height: 10), // Space between title and subtitle
            Text(
              '• Data Integration and Standardization',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Build a unified platform to collect, integrate, and standardize logistics data from diverse sources, ensuring consistency for better analysis and decision-making.',
            ),
            SizedBox(height: 15),


            Text(
              '• Predictive Analytics and Optimization',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Utilize machine learning models for demand forecasting, route optimization, and risk prediction, allowing for proactive logistics management.',
            ),
            SizedBox(height: 15),

            Text(
              '• Data-Driven Decision Making',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Empower logistics professionals with actionable insights through dashboards and analytics tools, supporting evidence-based decisions to enhance operational efficiency.',
            ),
            SizedBox(height: 15),

            Text(
              '• Visibility and Tracking',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Develop solutions that provide  tracking of shipments and vehicles, offering transparency into operations and enabling rapid response to disruptions.',
            ),
            SizedBox(height: 15),

            Text(
              '• Improvement and Scalability',
              style: TextStyle(fontSize: 20), // Adjust the font size for subtitle
            ),
            SizedBox(height: 5), // Adds space between widgets
            Text(
              'Establish a framework for ongoing data analysis and process improvement, ensuring the system adapts to changing conditions and scales with business growth.',
            ),
            
          ],
        ),
      ),
    );
  }
}
