import 'package:flutter/material.dart';

class AttributeOption extends StatefulWidget {
  final String title;
  final String assetPath;
  final bool isActive;
  final void Function(bool) onChanged;

  const AttributeOption({
    super.key,
    required this.title,
    required this.assetPath,
    required this.isActive,
    required this.onChanged,
  });

  @override
  State<AttributeOption> createState() => _AttributeOptionState();
}

class _AttributeOptionState extends State<AttributeOption> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(widget.assetPath, width: 72, height: 72),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Switch(value: widget.isActive, onChanged: widget.onChanged),
          ],
        )
      ],
    );
  }
}
