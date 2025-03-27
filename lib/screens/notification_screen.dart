import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            elevation: 4,
            child: ListTile(
              title: Text("Cluster Name: Informatica"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Event: Hackathon 2025"),
                  Text("Date: 25 March | Time: 10 AM | Venue: Hall 3"),
                  Text("Registration will be closed soon!", style: TextStyle(color: Colors.red)),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("View More →"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
