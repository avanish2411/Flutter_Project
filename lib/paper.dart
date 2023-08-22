import 'package:flutter/material.dart';

class Paper extends StatefulWidget {
  const Paper({Key? key}) : super(key: key);

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conference Track"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Center(child: Text("Conference Track",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              ),
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                "We cordially invite young researchers and practitioners in the field of computer engineering to submit their high-quality research papers to the International Conference on EMERGING TECHNOLOGIES IN HEALTHCARE: A New Tomorrow (NICSET 2023). We encourage submissions that present innovative ideas, novel approaches, recent developments, cutting-edge technologies, best practices, tools and techniques, insightful metrics, and future directions in the healthcare domain. While the following list highlights some subjects of interest, it is by no means exhaustive, and we welcome submissions on related topics as well:",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Row(
              children:const [
                Text("\u2022", style: TextStyle(fontSize: 40),), //bullet text
                SizedBox(width: 10,), //space between bullet and text
                Expanded( 
                  child:Text("AI and Data Analytics in Healthcare", style: TextStyle(fontSize: 15),), //text
                )
              ]
            ),
            Row(
              children:const [
                Text("\u2022", style: TextStyle(fontSize: 40),), //bullet text
                SizedBox(width: 10,), //space between bullet and text
                Expanded( 
                  child:Text("Security and Privacy in Healthcare", style: TextStyle(fontSize: 15),), //text
                )
              ]
            ),
            Row(
              children:const [
                Text("\u2022", style: TextStyle(fontSize: 40),), //bullet text
                SizedBox(width: 10,), //space between bullet and text
                Expanded( 
                  child:Text("Health Informatics and Pharmaceuticals", style: TextStyle(fontSize: 15),), //text
                )
              ]
            ),
            Row(
              children:const [
                Text("\u2022", style: TextStyle(fontSize: 40),), //bullet text
                SizedBox(width: 10,), //space between bullet and text
                Expanded( 
                  child:Text("Internet of Things in Healthcare", style: TextStyle(fontSize: 15),), //text
                )
              ]
            ),
            Row(
              children:const [
                Text("\u2022", style: TextStyle(fontSize: 40),), //bullet text
                SizedBox(width: 10,), //space between bullet and text
                Expanded( 
                  child:Text("Advanced Communication Technologies in Smart Healthcare", style: TextStyle(fontSize: 15),), //text
                )
              ]
            ),
            Row(
              children:const [
                Text("\u2022", style: TextStyle(fontSize: 40),), //bullet text
                SizedBox(width: 10,), //space between bullet and text
                Expanded( 
                  child:Text("AR/VR and 3D Printing Applications in Healthcare", style: TextStyle(fontSize: 15),), //text
                )
              ]
            ),
            
          ],
        ),
      ),
    );
  }
}
