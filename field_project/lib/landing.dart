// landing.dart
import 'package:field_project/Api_service.dart';
import 'package:flutter/material.dart';
import 'package:field_project/user_model.dart';
import 'package:field_project/processingscreen.dart';

class LandingScreen extends StatelessWidget {
  final Userlist user;

  const LandingScreen({Key? key, required this.user}) : super(key: key);

  void _acceptTicket(BuildContext context) async {
    // Update the status of the ticket to accepted
    //await ApiService.updateTicketStatus(user.id, 'accepted');

    // Navigate to the ProcessingScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProcessingScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'ID',
              ),
              controller: TextEditingController(text: user.id.toString()),
              readOnly: true,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              controller: TextEditingController(text: user.name),
              readOnly: true,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              controller: TextEditingController(text: user.email),
              readOnly: true,
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () => _acceptTicket(context),
                child: Text('Accept'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
