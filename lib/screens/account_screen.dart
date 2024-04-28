import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
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
          SizedBox(height: 24),
          Text(
            'Nama',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                hintText: "Dimas Pramudya",
              ),
              readOnly: true,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Email',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                hintText: "dimpram@gmail.com",
              ),
              readOnly: true,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Jabatan',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                hintText: "Safety Officer",
              ),
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}
