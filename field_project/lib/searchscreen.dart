import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchItemsFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No items found'));
          }

          final items = snapshot.data!;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                leading: Icon(item['icon']),
                title: Text(item['id']),
                onTap: () {
                  // Handle item tap
                },
              );
            },
          );
        },
      ),
    );
  }
}
Future<List<Map<String, dynamic>>> fetchItemsFromDatabase() async {
  // Simulating a database fetch with a delay
  await Future.delayed(Duration(seconds: 2));
  return List.generate(20, (index) {
    return {
      "id": "ID${index + 1}",
      "icon": Icons.person,
    };
  });
}
