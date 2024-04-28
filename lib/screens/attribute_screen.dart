import 'package:flutter/material.dart';
import 'package:sipapd_mobile/widgets/attribute_option.dart';

class AttributeScreen extends StatefulWidget {
  const AttributeScreen({super.key});

  @override
  State<AttributeScreen> createState() => _AttributeScreenState();
}

class _AttributeScreenState extends State<AttributeScreen> {
  bool _gloves = true;
  bool _vest = true;
  bool _boots = true;
  bool _helmet = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                IconData(0xe0b5, fontFamily: 'MaterialIcons'),
                size: 32,
              ),
              SizedBox(width: 8),
              Text(
                'Attribute',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          AttributeOption(
            title: "Gloves",
            assetPath: "assets/rubber-gloves.png",
            isActive: _gloves,
            onChanged: (bool value) {
              setState(() {
                _gloves = value;
              });
            },
          ),
          const SizedBox(height: 24),
          AttributeOption(
            title: "Vest",
            assetPath: "assets/vest.png",
            isActive: _vest,
            onChanged: (bool value) {
              setState(() {
                _vest = value;
              });
            },
          ),
          const SizedBox(height: 24),
          AttributeOption(
            title: "Boots",
            assetPath: "assets/boots.png",
            isActive: _boots,
            onChanged: (bool value) {
              setState(() {
                _boots = value;
              });
            },
          ),
          const SizedBox(height: 24),
          AttributeOption(
            title: "Helmet",
            assetPath: "assets/safety.png",
            isActive: _helmet,
            onChanged: (bool value) {
              setState(() {
                _helmet = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
