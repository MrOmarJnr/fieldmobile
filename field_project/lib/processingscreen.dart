// processing_screen.dart
import 'package:flutter/material.dart';
import 'package:field_project/user_model.dart';

class ProcessingScreen extends StatelessWidget {
  final Userlist user;

  const ProcessingScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Processing Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Additional Information',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Notes',
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to send information to the database
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
