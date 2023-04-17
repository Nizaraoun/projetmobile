// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';

class role extends StatefulWidget {
  const role({super.key});
  @override
  State<role> createState() => _roleState();
}

class _roleState extends State<role> {
  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 84, 222, 88),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.only(top: 100, left: 15, right: 15),
            width: double.infinity,
            height: 200,
            child: DropdownButton(
              autofocus: false,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              hint: Text("route no.1"),
              alignment: Alignment.center,
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("route no.1"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("route no.2"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("route no.3"),
                ),
              ],
              onChanged: (value) {},
            ))
      ],
    )));
  }
}
