import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_application/generate_question.dart';

import 'package:provider/provider.dart';
import 'package:quiz_application/result.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>{

  late int selectedOption;
  int score = 0;
  int _counter = 5;
  late Timer _timer;
  late List<int> answerOptions;
  late int answer;
  late int otherOptions;



  var question = GenerateQuestion();
  late String currentQuestion;

  @override
  void initState()
  {

    currentQuestion = question.QuestionGenerator();
    generateAnswerOptions();

    startTimer();

    super.initState();
  }


  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          //currentQuestion = question.QuestionGenerator();
          _counter--;
        } else {
          _timer.cancel();
          //context.go('quiz/result');
         navigateToResultPage();
        }
      });
      print("tick : " + timer.tick.toString());
    });
  }

  void resetTimer() {
  //
    //_timer.cancel();
    print("Timer reset");
    _counter = 5;
   // initState();
  }

  String generateQuestions()
  {
    return currentQuestion = question.QuestionGenerator();
  }

generateAnswerOptions()
  {
    Random random = Random();
    answer = question.AnswerGenerator();
    answerOptions = [answer];
    //  int otherOptions = random.nextInt(answer - 15)+ (answer + 15);
    for(int i = 0;i<3;i++){
      otherOptions = random.nextInt(30) + answer - 15;
      // otherOptions = max(0, otherOptions); // Ensure otherOptions is at least 1
      otherOptions = min(5000, otherOptions);
      answerOptions.add(otherOptions);
    }


    //answerOptions = [answer, otherOptions, otherOptions, otherOptions ];
    answerOptions.shuffle();

  }

  double remaining()
  {
    double remaining = (_counter/5);
    return remaining;
  }
  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  void navigateToResultPage()
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(score: score),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
        backgroundColor: Color.fromRGBO(0,0,63,1),
      ),
      body: Container(
        color: Color.fromRGBO(85,4,194,1),
        padding: EdgeInsets.all(60),
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              LinearProgressIndicator(
                value: remaining(),
              ),
              SizedBox(height: 40),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(currentQuestion,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),),
                  SizedBox(height: 40),

                  ListView.separated(
                   shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index){


                     return Container(
                        color: const Color.fromRGBO(0,0,63,1),
                        child: ListTile(
                          title: Text(answerOptions[index].toString(),

                          style: const TextStyle(
                            fontSize: 30,
                          ),
                          ),

                          textColor: Colors.white,
                         // selected: selectedOption == index,
                         //
                         //  selected: selectedOption == index,
                         //  selectedTileColor: Colors.green,
                          onTap: () {
                            setState(() {
                              selectedOption = index;
                            });

                            if(_counter>0 && answerOptions[index] == answer) {
                             // selectedTileColor:Colors.green;
                              score++;

                              generateQuestions();
                              generateAnswerOptions();
                              resetTimer();




                            }

                            else
                              {
                                selectedTileColor : Colors.red;
                             //   resetTimer();
                                _timer.cancel;
                               // context.go('quiz/result');
                                navigateToResultPage();

                              }
                          },
                        ),

                      );

                      },

                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}