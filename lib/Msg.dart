import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ap/SignInPage.dart';
import 'package:flutter_ap/VSelect.dart';
import 'package:flutter_ap/Support.dart';


class MessagingPage extends StatefulWidget {
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  List<File> attachments = [];

  void _sendMessage() {
    // Handle sending message
  }

  Future<void> _attachFile() async {
    var FilePicker;
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        attachments.addAll(result.paths.map((path) => File(path!)).toList());
      });
    }
  }

  Future<void> _attachImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        attachments.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messagerie'),
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
                // Hna ndiro navigate to Viewrs page
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (var attachment in attachments)
                  ListTile(
                    title: Text(attachment.path.split('/').last),
                    leading: Icon(Icons.attach_file),
                  ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.attach_file),
                onPressed: _attachFile,
              ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: _attachImage,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Votre message...',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageSource {
  static var gallery;
}

class ImagePicker {
  getImage({required source}) {}
}

class FilePickerResult {
  get paths => null;
}

void showAlertDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
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
}