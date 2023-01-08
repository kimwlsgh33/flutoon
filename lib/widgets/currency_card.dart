import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name;
  final double amount;
  final String code;
  final Icon icon;
  final Color bgColor;
  final Color textColor;

  const CurrencyCard({
    Key? key,
    required this.icon,
    required this.name,
    required this.amount,
    required this.code,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge, // clip children
      decoration: BoxDecoration(
        color: bgColor,
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
                    color: textColor,
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
                      double.parse(amount.toStringAsFixed(2)).toString(),
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      code,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
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
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
