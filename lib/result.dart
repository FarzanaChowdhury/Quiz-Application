import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'quiz.dart';
import 'package:provider/provider.dart';




class ResultPage extends StatelessWidget {
  final int score;

  ResultPage({required this.score});


  // final scoreProvider = Provider.of<ScoreProvider>(context);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void navigateToQuizPage()
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizPage(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(85,4,194,1),
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: Color.fromRGBO(0,0,63,1),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
        child: Center(
            child: Column(
              children: [
                Text("Your Score is : " + score.toString(),
                style: TextStyle(
                  fontSize: 30,
                //  fontFamily: 'LemonJelly',
                  color: Colors.white,
                ),),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  //  primary: Color.fromRGBO(245,3,244,1),
                  primary: Color.fromRGBO(0,0,63,1),
                ),
                    child: Text('Restart',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    onPressed: () {

                      // Navigate to the quiz page
                     // context.go('/quiz');
                    navigateToQuizPage();

                    })
              ],
            ),

        ),
      ),
    );


    throw UnimplementedError();
  }

}

