import 'package:flutter/material.dart';
import 'dart:async';

class MyTimer extends StatefulWidget {
//  const MyTimer({super.key, required this.title});
  const MyTimer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyTimer> createState() => MyTimerState();

}

class MyTimerState extends State<MyTimer> {
  int _counter = 5;

  int initial = 5;
  bool isStarted = true;
  late Timer timer;
  
  @override
  void initState()
  {
    
    Timer.periodic(const Duration(seconds: 1),(timer)
    {


      setState(()  {

        if(isStarted == false) {

          timer.cancel();
        }
          if(_counter >0) {
            _counter--;
          }
          else
            {
              timer.cancel();

            }

      });
      print(timer.tick);
    });

    super.initState();
  }

  int getCounter()
  {
    return this._counter;
  }

  double remaining()
  {
    double remaining = (getCounter()/5) *100;
    return remaining;

  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void reset()
  {
    setState(() {

      _counter = 5;
      initState();
    });
  }

  // void start()
  // {
  //
  //   initState();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}
