import 'package:flutter/material.dart';
import 'package:tomato/TomatoClassic.dart';
import 'package:tomato/TimeChallenge.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tomato Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TomatoClassic()),
                );
              },
              child: Text(
                'Classic',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(250, 60)),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimeChallenge()),
                );
              },
              child: Text(
                'Time Challenge',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(250, 60)),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add code to navigate to the 'Leaderboard' screen here
              },
              child: Text(
                'Leaderboard',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(250, 60)),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add code to handle logout here
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(250, 60)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
