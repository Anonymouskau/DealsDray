import 'package:flutter/material.dart';
class CircularIconList extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.phone_android, 'label': 'Mobile'},
    {'icon': Icons.laptop, 'label': 'Laptop'},
    {'icon': Icons.camera_alt, 'label': 'Camera'},
    {'icon': Icons.lightbulb, 'label': 'LED'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.shade100,
              ),
              child: Icon(
                items[index]['icon'],
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              items[index]['label'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}