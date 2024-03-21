import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabs(),
    );
  }
}
class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}
class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Hanim'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'For You'),
            Tab(text: 'Following'),
          ],
          labelColor: Colors.white, // Menentukan warna teks aktif
        ),
        backgroundColor: Colors.blue, // Mengatur warna latar belakang tab
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ForYouTab(),
          FollowingTab(),
        ],
      ),
    );
  }
}
class ForYouTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Menambahkan border
            borderRadius: BorderRadius.circular(8.0), // Mengatur border radius
          ),
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Data ke ${index}'),
          ),
        );
      },
    );
  }
}
class FollowingTab extends StatelessWidget {
  final List<String> assetPaths = [
    'assets/ppupn.jpg',
    'assets/ppupn.jpg',
    'assets/ppupn.jpg',
    'assets/ppupn.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30.0, // Jarak antar gambar secara vertikal
          crossAxisSpacing: 30.0, // Jarak antar gambar secara horizontal
          childAspectRatio: 1.0, // Rasio aspek gambar
        ),
        itemCount: assetPaths.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // Menambahkan border
              borderRadius:
                  BorderRadius.circular(8.0), // Mengatur border radius
            ),
            child: SizedBox(
              width: 10, // Atur lebar gambar
              height: 10, // Atur tinggi gambar
              child: Image.asset(
                assetPaths[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}