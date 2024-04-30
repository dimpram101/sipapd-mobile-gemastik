import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sipapd_mobile/screens/account_screen.dart';
import 'package:sipapd_mobile/screens/attribute_screen.dart';
import 'package:sipapd_mobile/screens/detection_screen.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTab();
}

class _BottomTab extends State<BottomTab> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var screen = [
    const DetectionScreen(),
    const AttributeScreen(),
    const AccountScreen(),
  ];

  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();

    await fcm.subscribeToTopic("detection");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SIPAPD'),
      // ),
      body: SafeArea(
        child: screen[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe4b7, fontFamily: 'MaterialIcons')),
            label: 'Detections',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe0b5, fontFamily: 'MaterialIcons')),
            label: 'Attributes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
