import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Map<String, dynamic> _user = {};

  void _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user!.email).get();

    setState(() {
      _user = userData.docs.first.data();
    });
  }

  void _logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    if (_user.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 32,
              ),
              SizedBox(width: 8),
              Text(
                'Account Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Nama',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                hintText: _user['name'],
              ),
              readOnly: true,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Email',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                hintText: _user['email'],
              ),
              readOnly: true,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Jabatan',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                hintText: _user['jabatan'],
              ),
              readOnly: true,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                backgroundColor: Colors.purple[800],
              ),
              onPressed: _logout,
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
