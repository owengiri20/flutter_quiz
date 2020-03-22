import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

class QuizBrain {
  int correctTotal = 0;
  int wrongTotal = 0;
  int totalScore = 0;
  int _questionNumber = 1;
  bool finish = false;

  List scoreKeeper = <Icon>[];
  List _questions = <Question>[
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestionText(){
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questions[_questionNumber].questionAnswer;
  }

  int getQuestionsAmount (){
    return _questions.length;
  }

  void nextQuestion() {
    if(_questionNumber < getQuestionsAmount()-1){
      _questionNumber++;
    }else{
      handleFinish();
    }
  }

  void updateScore(bool correct) {
    if(correct) {
      correctTotal++;
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    }else{
      wrongTotal ++;
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  void nextHandler (bool pick) {
    bool correct = getQuestionAnswer() == pick ? true : false;
    updateScore(correct);
    nextQuestion();

  }

  void handleFinish() {
    finish = true;
    print("correct: $correctTotal\nwrong: $wrongTotal\ntotal: $totalScore");
  }

  int getQuestionNumber () {
    return _questionNumber;
  }

  void reset () {
    _questionNumber=0;
    correctTotal = 0;
    wrongTotal = 0;
    totalScore = 0;
    scoreKeeper.clear();
    finish = false;
  }


}
