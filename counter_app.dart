// Counter App - StatefulWidget Example
// This demonstrates Flutter's reactive UI system with setState()

import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  // Mutable state - changes over time
  int count = 0;

  // Method to increment counter
  void increment() {
    setState(() {
      // setState tells Flutter to rebuild this widget
      count++;
    });
  }

  // Method to decrement counter
  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  // Method to reset counter
  void reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method runs every time setState() is called
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget Demo'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: reset,
              tooltip: 'Reset Counter',
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pressed the button:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // This Text widget rebuilds when count changes
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: count > 10 ? Colors.red : Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Text(
                count == 0
                    ? 'Start counting!'
                    : count < 10
                    ? 'Keep going!'
                    : 'Wow! That\'s a lot!',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Decrement button
                  ElevatedButton.icon(
                    onPressed: count > 0 ? decrement : null,
                    icon: Icon(Icons.remove),
                    label: Text('Decrease'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(width: 20),
                  // Increment button
                  ElevatedButton.icon(
                    onPressed: increment,
                    icon: Icon(Icons.add),
                    label: Text('Increase'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

/*
 * Understanding the Reactive UI:
 * 
 * 1. State Management:
 *    - 'count' is mutable state stored in _CounterAppState
 *    - Only StatefulWidget can maintain mutable state
 * 
 * 2. setState() Function:
 *    - Tells Flutter "something changed, rebuild this widget"
 *    - Marks the widget as "dirty" in the element tree
 *    - Triggers a call to build() method
 *    - Flutter efficiently updates only changed parts
 * 
 * 3. Reactive Flow:
 *    User taps button → increment() called → setState() invoked
 *    → count++ executed → build() runs → UI updates
 * 
 * 4. Efficient Rendering:
 *    - Flutter doesn't rebuild the entire app
 *    - Only the _CounterAppState widget tree is rebuilt
 *    - The Text widget showing count gets new value
 *    - Scaffold, AppBar, etc. remain unchanged
 * 
 * 5. Widget Lifecycle:
 *    - createState(): Creates mutable state object (once)
 *    - build(): Builds UI (every time setState is called)
 * 
 * Try This:
 * - Run the app and tap the button
 * - Notice how only the count number changes
 * - The text color changes to red after 10 clicks
 * - The message changes based on count value
 * - Decrement button is disabled when count is 0
 * 
 * This demonstrates Flutter's reactive programming model:
 * UI = f(state) - The UI is a function of the current state
 */
