import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ap/VSelect.dart';
import 'package:flutter_ap/Support.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController identifyController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Sign In', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView( // Wrap your Column with SingleChildScrollView
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 20.0), // Adjusted bottom margin
                child: Image.asset(
                  "assets/Images/logo.png",
                  width: 250,
                  height: 250,
                ),
              ),
              TextField(
                controller: identifyController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(15),
                ],
                decoration: InputDecoration(
                  labelText: 'Enter l\'identifiant',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  _signIn(identifyController.text, passwordController.text, context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(193, 133, 54, 54),
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Connection',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportPage()),
                  );
                },
                child: Text(
                  'Mot de passe oublié ? Cliquez ici',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn(String identify, String password, BuildContext context) {
    if (_isValidIdentify(identify) && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VehicleSelectionPage()),
      );
    } else {
      print('Sign in failed');
    }
  }

  bool _isValidIdentify(String identify) {
    try {
      int identifyNumber = int.parse(identify);
      return identifyNumber >= 0 && identify.length >= 7 && identify.length <= 15;
    } catch (e) {
      return false;
    }
  }
}
