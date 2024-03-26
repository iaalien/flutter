import 'package:flutter/material.dart';
import 'package:flutter_ap/SignInPage.dart';
import 'package:flutter_ap/VDoc.dart';
import 'package:flutter_ap/Msg.dart';
import 'package:flutter_ap/Support.dart';

class VehicleSelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> userVehicles = [
    {'type': 'Car', 'name': 'Mercedes',},
    {'type': 'Car', 'name': 'BMW'},
    {'type': 'Car', 'name': 'Audi'},
    {'type': 'Car', 'name': 'Honda'},
    {'type': 'Motorcycle', 'name': 'Yamaha'},
    {'type': 'Car', 'name': 'Porsche'},
    {'type': 'Car', 'name': 'Ferrari'},
    {'type': 'Car', 'name': 'Lamborghini'},
    {'type': 'Car', 'name': 'Bugatti'},
    {'type': 'Taxi', 'name': 'Taxi'},
    {'type': 'Bus', 'name': 'Bus'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélectionnez un Véhicule', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(193, 133, 54, 54),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(193, 133, 54, 54),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Accueil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VehicleSelectionPage()),
                );
              },
            ),
            ListTile(
              title: Text('Viewrs'),
              onTap: () {
                // Navigate to Viewrs page
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                // Gérer les notifications
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Notifications'),
                      content: Text('Aucune nouvelle notification'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fermer'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text('Scanner le code QR'),
              onTap: () {
                // Gérer le code QR
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Scanner le code QR'),
                      content: Text('Placeholder pour le scanner de code QR'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fermer'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text('Message'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagingPage()),
                );
              },
            ),
            ListTile(
              title: Text('Aider'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportPage()),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: userVehicles.length,
        itemBuilder: (context, index) {
          final vehicle = userVehicles[index];
          return SizedBox(
            height: 150,
            child: Card(
              color: Color.fromARGB(255, 181, 179, 183),
              child: ListTile(
                leading: _buildVehicleIcon(vehicle['type']),
                title: Text(
                  vehicle['name'],
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: vehicle['type'] == 'Motorcycle' ? 36.0 : 24.0, // Adjusted font size for motorcycles
                  ),
                ),
                subtitle: Text(
                  'Matricule: 123456',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 24.0,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VehicleDocumentsPage(vehicle: vehicle['name'])),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVehicleIcon(String type) {
    switch (type) {
      case 'Car':
        return Icon(Icons.directions_car, size: 60); // Increased size for car icon
      case 'Motorcycle':
        return Icon(Icons.motorcycle, size: 36); // Adjusted size for motorcycle icon
      case 'Taxi':
        return Icon(Icons.local_taxi, size: 60); // Increased size for taxi icon
      case 'Bus':
        return Icon(Icons.directions_bus, size: 60); // Increased size for bus icon
      default:
        return Icon(Icons.directions_car, size: 60);
    }
  }
}

      /*
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.blue),
              onPressed: () {
                // Gérer les notifications
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Notifications'),
                      content: Text('Aucune nouvelle notification'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fermer'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.green),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagingPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.qr_code, color: Colors.orange),
              onPressed: () {
                // Gérer le code QR
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Scanner le code QR'),
                      content: Text('Placeholder pour le scanner de code QR'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fermer'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),*/
   