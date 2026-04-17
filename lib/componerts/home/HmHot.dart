import 'package:flutter/material.dart';

class Hmhotpage extends StatefulWidget {
  const Hmhotpage({super.key});

  @override
  State<Hmhotpage> createState() => _HmhotpageState();
}

class _HmhotpageState extends State<Hmhotpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
