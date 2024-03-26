import 'package:flutter/material.dart';
import 'package:flutter_ap/SignInPage.dart';
import 'package:flutter_ap/VSelect.dart';
import 'package:flutter_ap/Msg.dart';
import 'package:flutter_ap/Support.dart';

class VehicleDocumentsPage extends StatelessWidget {
  final String vehicle;

  VehicleDocumentsPage({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    // documents 
    List<String> documents = [
      'Document 1',
      'Document 2',
      'Document 3',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Documents du $vehicle'),
        backgroundColor: Color.fromARGB(193, 133, 54, 54),
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
                // Hna 5assna ndiro navigate to viewrs page
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                // Gérer notif
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
                // Gérer code QR
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
              title: Text('Longout'),
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
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final document = documents[index];
          return ListTile(
            title: Text(
              document,
              style: TextStyle(fontSize: 18.0),
            ),
            // njmo nzido les actions supplémentaires pour chaque document hnaya
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.notifications, color: Color.fromARGB(255, 20, 124, 36)),
              onPressed: () {
                // Gérer notif
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
              icon: Icon(Icons.message, color: Color.fromARGB(255, 160, 53, 53)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagingPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.qr_code, color: const Color.fromARGB(255, 220, 218, 214)),
              onPressed: () {
                // Gérer code QR
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
      ),
    );
  }
}