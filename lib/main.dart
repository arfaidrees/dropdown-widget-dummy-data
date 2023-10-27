import 'package:flutter/material.dart';
import 'dropdown.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Page with Navigator'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _navigateToNextScreen(context); // Call the navigation function
            },
            child: Text('Press Me'),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DropDownApi()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('This is the next screen!'),
      ),
    );
  }

