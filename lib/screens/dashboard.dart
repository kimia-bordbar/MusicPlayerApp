import 'package:flutter/material.dart';
import 'package:music_player/screens/category_screen.dart';
import 'package:music_player/screens/home_screen.dart';
import 'package:music_player/screens/playlist_screen.dart';
import 'package:music_player/screens/search_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  List<Widget> items = const [
    HomeScreen(),
    CategoryScreen(),
    PlayListScreen(),
    SearchScreen(),
  ];
  void _selectedItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'رادیو جوان',
          ),
        ),
        body: items.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'خانه',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'دسته بندی',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add),
              label: 'لیست پخش',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'جستجو',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _selectedItem,
        ),
      ),
    );
  }
}
