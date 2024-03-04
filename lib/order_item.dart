import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final int quantity;
  final bool isDarkModeEnabled;
  final VoidCallback onPressedPlus;
  final VoidCallback onPressedRemove;
  const OrderItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.quantity,
      required this.onPressedPlus,
      required this.onPressedRemove,
      required this.isDarkModeEnabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          child: Image.asset(
            imageUrl,
            height: 28,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            color: isDarkModeEnabled ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          price,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isDarkModeEnabled ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 22,
              height: 16,
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(width: 0.5, color: Colors.grey)),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: quantity != 0 ? onPressedRemove : null,
                icon: const Icon(
                  Icons.remove,
                  size: 10,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '$quantity',
              style: TextStyle(
                color: isDarkModeEnabled ? Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 22,
              height: 16,
              decoration: BoxDecoration(
                  color: const Color(0xFFFFCB3F),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(width: 0.5, color: Colors.grey)),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: quantity != 99 ? onPressedPlus : null,
                icon: const Icon(
                  Icons.add,
                  size: 10,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
