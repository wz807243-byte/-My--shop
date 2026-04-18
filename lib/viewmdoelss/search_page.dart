import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autocorrect: true,
          decoration: InputDecoration(
            hintText: "搜索",
            hintStyle: TextStyle(color: Colors.blueGrey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
