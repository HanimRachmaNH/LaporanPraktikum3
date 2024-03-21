import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Sample data
  final List<Map<String, dynamic>> userData = [
    {
      'name': 'Rani',
      'hobby': 'Belajar',
      'profileImageAsset': 'assets/fotorani.jpeg'
    },
    {
      'name': 'Hanim',
      'hobby': 'Bernyanyi',
      'profileImageAsset': 'assets/fotohanim.jpg'
    },
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            return UserCard(
              name: userData[index]['name']!,
              hobby: userData[index]['hobby']!,
              profileImageAsset: userData[index]['profileImageAsset']!,
            );
          },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String hobby;
  final String profileImageAsset;

  const UserCard({
    required this.name,
    required this.hobby,
    required this.profileImageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profileImageAsset),
        ),
        title: Text(name),
        subtitle: Text(hobby),
        trailing: Icon(Icons.more_vert), // Menambahkan titik tiga di sebelah kanan
      ),
    );
  }
}
