// Simple Flutter App - StatelessWidget Example
// This demonstrates the basic structure of a Flutter application

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Hello Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Flutter!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Icon(Icons.flutter_dash, size: 100, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                'Build beautiful cross-platform apps',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
 * Key Concepts:
 * 
 * 1. StatelessWidget: This widget doesn't maintain any state.
 *    It's immutable and rebuilds only when the parent changes.
 * 
 * 2. MaterialApp: The root widget that provides Material Design
 *    styling and navigation structure.
 * 
 * 3. Scaffold: Provides the basic visual structure with AppBar,
 *    Body, FloatingActionButton, etc.
 * 
 * 4. Widget Tree: MyApp → MaterialApp → Scaffold → AppBar/Body
 *    Each widget is composed of other widgets.
 * 
 * 5. Hot Reload: Try changing the text or colors above and press
 *    'r' in the terminal or click the hot reload button to see
 *    instant changes without restarting the app!
 */
