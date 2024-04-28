import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sipapd_mobile/widgets/attribute_option.dart';

class AttributeScreen extends StatefulWidget {
  const AttributeScreen({super.key});

  @override
  State<AttributeScreen> createState() => _AttributeScreenState();
}

class _AttributeScreenState extends State<AttributeScreen> {
  List<Map<String, dynamic>> _attributeData = [];

  void _getAttributeData() async {
    final attributeData = await FirebaseFirestore.instance.collection('attributes').get();
    final allData = attributeData.docs.map((doc) => doc.data()).toList();

    setState(() {
      _attributeData = allData;
    });
  }

  void _updateAttributeData(String attrName, bool isActive) async {
    final attributeData =
        await FirebaseFirestore.instance.collection('attributes').where('name', isEqualTo: attrName).get();
    final docId = attributeData.docs.first.id;

    await FirebaseFirestore.instance.collection('attributes').doc(docId).update({'is_active': isActive});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAttributeData();
  }

  @override
  Widget build(BuildContext context) {
    if (_attributeData.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

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
            isActive: _attributeData.firstWhere((element) => element['name'] == 'Gloves')['is_active'] ?? false,
            onChanged: (bool value) {
              _updateAttributeData("Gloves", value);
              setState(() {
                _attributeData.firstWhere((element) => element['name'] == 'Gloves')['is_active'] = value;
              });
            },
          ),
          const SizedBox(height: 24),
          AttributeOption(
            title: "Vest",
            assetPath: "assets/vest.png",
            isActive: _attributeData.firstWhere((element) => element['name'] == 'Vest')['is_active'] ?? false,
            onChanged: (bool value) {
              _updateAttributeData("Vest", value);
              setState(() {
                _attributeData.firstWhere((element) => element['name'] == 'Vest')['is_active'] = value;
              });
            },
          ),
          const SizedBox(height: 24),
          AttributeOption(
            title: "Shoes",
            assetPath: "assets/boots.png",
            isActive: _attributeData.firstWhere((element) => element['name'] == 'Shoes')['is_active'] ?? false,
            onChanged: (bool value) {
              setState(() {
                _updateAttributeData("Shoes", value);
                setState(() {
                  _attributeData.firstWhere((element) => element['name'] == 'Shoes')['is_active'] = value;
                });
              });
            },
          ),
          const SizedBox(height: 24),
          AttributeOption(
            title: "Helmet",
            assetPath: "assets/safety.png",
            isActive: _attributeData.firstWhere((element) => element['name'] == 'Helmet')['is_active'] ?? false,
            onChanged: (bool value) {
              _updateAttributeData("Helmet", value);
              setState(() {
                _attributeData.firstWhere((element) => element['name'] == 'Helmet')['is_active'] = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
