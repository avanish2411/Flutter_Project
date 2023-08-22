import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 200,left: 5),
          child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 7),
              child: Image.asset(
              "assets/images/NICS logo.png",width: 200,height: 300,),
            ),
            const Text("2023",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
          ],
         ),
        ),
        const Text("Powered By NIET",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
      ]
      ),
    ),
    );
  }
}
