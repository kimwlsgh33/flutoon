import 'package:flutter/material.dart';
import 'package:toons/widgets/defail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    Key? key,
    required this.title,
    required this.thumb,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('tapped');
        // Navigator.pushNamed(context, '/detail', arguments: id);
        Navigator.push(
          context,
          MaterialPageRoute(
            // make a new route
            builder: (context) {
              return DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              );
            },
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Container(
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
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              // fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
