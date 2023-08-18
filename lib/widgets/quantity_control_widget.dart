import 'package:flutter/material.dart';

class QuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;

  const QuantityControl({
    super.key,
    required this.quantity,
    required this.onMinusPressed,
    required this.onPlusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                const Size(25, 25),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFFF6F6F6),
              ),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 2))),
          onPressed: onMinusPressed,
          child: const Text(
            "-",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12),
          ),
        ),
        Text(quantity.toString(),
            style:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                const Size(25, 25),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(21, 153, 84, 1),
              ),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 2))),
          onPressed: onPlusPressed,
          child: const Text(
            "+",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 12),
          ),
        ),
      ],
    );
  }
}
