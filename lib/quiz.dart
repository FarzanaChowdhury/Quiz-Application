import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_application/generate_question.dart';


class QuizPage extends StatelessWidget{
  late int selectedOption;
  List<String> options = ["Option A", "Option B", "Option C"];
  var question =GenerateQuestion();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
      ),
      body: Container(
        color: Color.fromRGBO(85,4,194,1),
        padding: EdgeInsets.all(60),
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 40),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(question.QuestionGenerator()+ "= ?",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),),
                  SizedBox(height: 40),

                  ListView.separated(
                   shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index){

                     Random random = Random();
                     int answer = question.AnswerGenerator();
                     int otherOptions = random.nextInt(answer - 15)+ (answer + 15);

                     List<int> answerOptions = [answer, otherOptions, otherOptions, otherOptions ];
                    answerOptions.shuffle();
                     return Container(
                        color: const Color.fromRGBO(0,0,63,1),
                        child: ListTile(
                          title: Text(answerOptions[index].toString(),
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                          ),

                          textColor: Colors.white,
                          onTap: () {
                            selectedOption = index;
                            // Handle item tap
                            print('$selectedOption tapped');
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