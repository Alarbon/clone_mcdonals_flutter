import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  final String tittle;
  final String imageURL;
  final String price;
  final bool isDarkModeEnabled;
  const PopularItem(
      {super.key,
      required this.tittle,
      required this.imageURL,
      required this.price,
      required this.isDarkModeEnabled});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: 100,
        child: Column(
          children: [
            SizedBox(
              child: Image.asset(
                imageURL,
                height: 36,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              tittle,
              textAlign: TextAlign.center,
              style:  TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: isDarkModeEnabled ? Colors.white : Colors.black),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
      Text(
        price,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: Color(0xFFFFCB3F),
        ),
      )
    ]));
  }
}
