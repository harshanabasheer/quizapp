import 'package:flutter/material.dart';
import 'package:quizapp/model/quizmodel.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  List items=[
    QuizModel(question:"The sky is usually red during a clear sunrise", answer: false),
    QuizModel(question:"The Great Wall of China is visible from space", answer: false),
    QuizModel(question:"A triangle has four sides", answer: false),
    QuizModel(question:"Earth is the only planet in our solar system with liquid water on its surface", answer: true),
    QuizModel(question:"Gold is a magnetic metal", answer: false),
    QuizModel(question:"The capital of France is Islamabad", answer: true),
    QuizModel(question:"Bananas grow on trees", answer: false),
    QuizModel(question:"Spiders are heterotrophs", answer: true),
    QuizModel(question:"The capital of Kerala is Trivadram", answer: true),
    QuizModel(question:"The human brain stops developing after childhood", answer: false),
  ];
  // if (index < items.length) {
  // } else {
  // }
  int _qno=0;
  int count =0;
  List<Icon>ico=[];
 String getQuestion(){
   return items[_qno].question;
 }
 bool getAnswer(){
   return items[_qno].answer;
 }
  int reset() {
    count = 0;
    _qno = 0;
    return(_qno);
  }
  void nextQustion(){
   if(_qno< items.length){
     _qno++;
   }
  }
  bool isFinished(){
   if(_qno>=items.length-1){
     return true;
   }else{
     return false;
   }
  }
  void checkAnswer(bool answer){
   bool value=getAnswer();
   setState(() {
     if(isFinished() == true){
       if(count<=5){
         Widget okButton = TextButton(
           child: Text("OK"),
           onPressed: () {
             Navigator.of(context).pop();
           },
         );
         AlertDialog alert = AlertDialog(
           title: Text("Game over"),
           actions: [
             okButton,
           ],
         );
         showDialog(
           context: context,
           builder: (BuildContext context) {
             return alert;
           },
         );
         reset();
         ico=[];
       }else{
         Widget okButton = TextButton(
           child: Text("OK"),
           onPressed: () {
             Navigator.of(context).pop();
           },
         );
         AlertDialog alert = AlertDialog(
           title: Text("Continue"),
           actions: [
             okButton,
           ],
         );
         showDialog(
           context: context,
           builder: (BuildContext context) {
             return alert;
           },
         );
         reset();
       }
     }else {
       if (value == answer) {
         // print(count);
         ico.add(Icon(Icons.check, color: Colors.green,));
         count++;
       } else {
         ico.add(Icon(Icons.close, color: Colors.red,));
       }
       nextQustion();
     }
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child:
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getQuestion(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                  SizedBox(height: 400),
                  Padding(
                    padding: const EdgeInsets.only(left:3,right:3),
                    child: ElevatedButton(onPressed: (){
                      checkAnswer(true);
                    },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Background color
                        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text("True",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left:3,right:3),
                    child: ElevatedButton(onPressed: (){
                      checkAnswer(false);
                    },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text("False",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: ico.map((icon) => icon).toList(),
                  ),



                ]
            ),
          ),

        )

    );

  }
}
