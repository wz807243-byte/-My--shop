import 'package:flutter/material.dart';

class Hmcategorypage extends StatefulWidget {
  const Hmcategorypage({super.key});

  @override
  State<Hmcategorypage> createState() => _HmcategorypageState();
}

class _HmcategorypageState extends State<Hmcategorypage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 100,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10),

            child: Text("分类${index + 1}", style: TextStyle(color: Colors.blue)),
          );
        },
      ),
    );
  }
}
