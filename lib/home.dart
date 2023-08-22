import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> imageList = [
    {"id": 1, "image_path": "assets/images/rajive.png"},
    {"id": 2, "image_path": "assets/images/rakesh.png"},
    {"id": 3, "image_path": "assets/images/ashwani.png"},
    {"id": 4, "image_path": "assets/images/murali.png"},
    {"id": 5, "image_path": "assets/images/aditya.png"},
    {"id": 6, "image_path": "assets/images/anbu.png"},
    {"id": 7, "image_path": "assets/images/u.png"},
    {"id": 8, "image_path": "assets/images/amit.png"},
    {"id": 9, "image_path": "assets/images/sridharan.png"},
    {"id": 10, "image_path": "assets/images/raghava.png"},
    {"id": 11, "image_path": "assets/images/praveen.png"},
    {"id": 12, "image_path": "assets/images/avjit.png"},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    //color: Colors.amberAccent,
                    padding: const EdgeInsets.only(left: 9, right: 10),
                    child: Image.asset(
                      "assets/images/nietlogo.png",
                      width: 140,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    //color: Colors.amber,
                    padding: const EdgeInsets.only(left: 10, right: 6),
                    child: Image.asset(
                      "assets/images/NICS logo.png",
                      width: 140,
                      height: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: const Text(
                  "NIET International Conference and Summit",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "On",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "EMERGING TECHNOLOGIES IN HEALTHCARE:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "A NEW TOMORROW",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "23-24 June 2023,NIET, Greater Noida, India",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Our Knowledge Partners",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),
              const SizedBox(
                height: 6,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 1, bottom: 20),
                child: Image.asset(
                  "assets/images/kp.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Event will conclude in:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.redAccent.shade700  )),
                child: CountdownTimer(
                  endTime: DateTime(2023, 6, 24).millisecondsSinceEpoch,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "ABOUT THE EVENT",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.only(top:5, left: 7, right: 7),
                //color: Colors.cyan,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: const Text(
                  "The NIET International Conference and Summit on Emerging Technologies in Healthcare - A New Tomorrow is "
                  "an global event held on June 23rd and 24th, 2023, in Greater Noida, India"
                  "It serves as a gathering of researchers, leaders, and academicians, aiming to explore "
                  " healthcare trends and foster innovation"
                  "The conference focuses on areas such as AI, Data Science, AR/VR, Medical IoT, Blockchain, and bioinformatics"
                  "Reality (AR/VR), Medical Internet of Things (IoT), Blockchain, and Bioinformatics, this event aims to explore the frontiers of healthcare "
                  "advancements. Aligned with the Indian government's vision of providing affordable and smart healthcare for all"
                  " the conference offers unparalleled opportunities for lifelong learning and aims to drive the development of healthcare solutions with a global impact.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Text(
                "Advisory Board",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // const SizedBox(
              //   height: 2,
              // ),
              InkWell(
                onTap: () {
                  //print(currentIndex);
                },
                child: CarouselSlider(
                    items: imageList
                        .map(
                          (item) => Image.asset(
                            item["image_path"],
                            fit: BoxFit.fitWidth,
                            width: 600,
                          ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 1.0,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        })),
              ),
              Positioned(
                  child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? Colors.blue
                                : Colors.black45),
                      ),
                    );
                  }).toList(),
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(width: 2, color: Colors.black))),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Contact Us:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Phone: +91-9169380895, +91-9616371192, +91-9999927108",
                style: TextStyle(fontSize: 12),
              ),
              const Text(
                "Email: submission@nicset.org",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(width: 2, color: Colors.black))),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Developed by: ",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const Text("Avanish Pratap Singh, Arpit Raj",style: TextStyle(fontSize: 14),),
              const Text("Under Supervision:",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const Text("Manyank Deep Khare, Vatika Jalali",style: TextStyle(fontSize: 14),),
              const Text("Department of CSE(IOT), Powered by NIET",style: TextStyle(fontSize: 14),),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
