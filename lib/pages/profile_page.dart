import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50, // Size of the profile picture
                backgroundImage: AssetImage('assets/images/gru.jpeg'), // Replace with your image path
              ),
            ),
            SizedBox(height: 16),
            Text('Name: Esel Bulawin', style: TextStyle(fontSize: 18)),
            Text('Email: eselbulawin@example.com', style: TextStyle(fontSize: 18)),
            Text('Country: United States', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
