import 'package:flutter/material.dart';
import 'package:trainapp/pages/main_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green, // Set the background color to green
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'DMR',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color to white
                ),
              ),
              const Text(
                'Dhaka Metro Rail',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color to white
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MainPage()),
              );
                },
                child: const Text('Get started'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical:
                          20), // Adjust the padding to make the button larger
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
