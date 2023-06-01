import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class GenerateQuestion{
  Random random = new Random();

  late int a,b,index;
  late String c;
  List<String> operator = ["+","-","*","/"];

  String QuestionGenerator()
  {
    a = random.nextInt(50) + 1;
    b = random.nextInt(50) + 1;
    index = random.nextInt(3)+0;
    c = operator[index];
    String question = a.toString()+c+b.toString();
    return question;
  }

  int AnswerGenerator()
  {
    int a = this.a;
    int b=this.b;
    if(index == 0)
      return a+b;
    else if(index == 1)
      return a-b;
    else if(index == 2)
      return a*b;
    else
      return a~/b;

  }


}