import 'package:flutter/material.dart';
import 'package:notes_new_ui/screens/calendar_page.dart';
import 'package:notes_new_ui/screens/home_page.dart';
import 'package:notes_new_ui/screens/setting_page.dart';
import 'package:notes_new_ui/screens/time_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedItem = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedItem,
        children: const <Widget>[
          SettingPage(),
          TimePage(),
          CalendarPage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: (int index) {
          setState(() {
            _selectedItem = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/settingsUnActive.png'),
            ),
            label: 'setting',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/timeUnActive.png'),
            ),
            activeIcon: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/timeActive.png'),
            ),
            label: 'time',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/calendarUnActive.png'),
            ),
            activeIcon: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/calendarActive.png'),
            ),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/homeUnActive.png'),
            ),
            activeIcon: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/homeActive.png'),
            ),
            label: 'home',
          ),
        ],
      ),
    );
  }
}
