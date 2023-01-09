import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(7, 7),
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 12, // soften the shadow
                    // spreadRadius: 1, //extend the shadow
                  ),
                ],
              ),
              width: 250,
              child: Image.network(thumb),
            ),
          ),
        ],
      ),
    );
  }
}
