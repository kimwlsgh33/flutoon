import 'package:flutter/material.dart';

class DarkModeCard extends StatelessWidget {
  final String name;
  final String amount;
  final String code;
  final bool dark;
  final IconData icon;
  final Color _blackColor = const Color(0xff1c1c1c);
  final Color _whiteColor = const Color(0xffe5e5e5);

  const DarkModeCard({
    super.key,
    required this.name,
    required this.amount,
    required this.code,
    required this.icon,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge, // clip children
      decoration: BoxDecoration(
        color: dark ? _blackColor : _whiteColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: dark ? _whiteColor : _blackColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: dark ? _whiteColor : _blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      code,
                      style: TextStyle(
                        color: dark
                            ? _whiteColor.withOpacity(0.7)
                            : _blackColor.withOpacity(0.7),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: const Offset(7, 12),
                child: Icon(
                  icon,
                  color: dark ? _whiteColor : _blackColor,
                  size: 95,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
