import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}
class _EventPageState extends State<EventPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule"),
      ),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Center(child: Text("Event Schedule",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: const Text("Day 1",textAlign: TextAlign.start,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
              ),
              Image.asset("assets/schedule/sc.png",fit: BoxFit.cover,),  
              Image.asset("assets/schedule/sc2.png",fit: BoxFit.cover,),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: const Text("Day 2",textAlign: TextAlign.start,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
              ),
              Image.asset("assets/schedule/sc3.png",fit: BoxFit.cover,),
              Image.asset("assets/schedule/sc4.png",fit: BoxFit.cover,),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: const Center(child: Text("Track Wise Schedule",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),)
              ),
              const SizedBox(height: 10,),
              Image.asset("assets/images/track1.jpg", fit: BoxFit.cover,),
              Image.asset("assets/images/track2.jpg", fit: BoxFit.cover,),
              Image.asset("assets/images/track3.jpg", fit: BoxFit.cover,),
              const SizedBox(height: 10,),
            ],
          ),
        )
    );
  }
}