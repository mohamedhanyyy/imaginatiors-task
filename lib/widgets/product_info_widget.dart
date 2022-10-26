import 'package:flutter/material.dart';

Widget buildProductItemWidget({
  required String imagePath,
  required String name,
  required String price,
}) {
  return Row(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            height: 80,
            width: 80,
            fit: BoxFit.fill,
          )),
      const SizedBox(
        width: 5,
      ),
      Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
      const Spacer(),
      Text(price.toString())
    ],
  );
}