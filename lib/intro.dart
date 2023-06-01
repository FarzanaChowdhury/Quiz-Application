import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';


class IntroPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(85,4,194,1),
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
       // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Welcome',),
        backgroundColor: Color.fromRGBO(0,0,63,1),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            SizedBox(height: 40),
            Text('Quiz Time!',
              style: TextStyle(
                  fontSize: 80,
              fontFamily: 'LemonJelly',
              color: Colors.white),
            ),
            SizedBox(height: 10),
            // ElevatedButton(onPressed: context.go('/quiz'),
            //     child: Text('Start')),


             Container(

                    padding: EdgeInsets.symmetric(horizontal: 85),
                    width: MediaQuery.of(context).size.width,

                    child: Image.asset('assets/images/Quiz_Image2.jpg', fit: BoxFit.fill,)
             ),

            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              //  primary: Color.fromRGBO(245,3,244,1),
                primary: Color.fromRGBO(0,0,63,1),
              ),
            child: Text('Start Quiz',
            style: TextStyle(
            color: Colors.white,
            ),),
            onPressed: () {


              // Navigate to the quiz page
              context.go('/quiz');
            }
    )
          ],

        ),
      ),
    );

    throw UnimplementedError();
  }

}

