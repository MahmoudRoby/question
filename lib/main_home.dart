import 'package:exam/question.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<Widget> answerResult = [];

  int questionCount = 0;

  int correctAnswerCount = 0;
  int faultAnswerCount = 0;

  List<Question> questionGroup = [
    Question(
      questionText: 'عدد الكواكب فى المجموعة الشمسية ',
      questionImage: 'images/image-1.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'القط حيوان لاحم ',
      questionImage: 'images/image-2.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'الصين موجوده فى قارة افريقيا ',
      questionImage: 'images/image-3.jpg',
      questionAnswer: false,
    ),
    Question(
      questionText: 'الارض مسطحة و ليست كروية ',
      questionImage: 'images/image-4.jpg',
      questionAnswer: false,
    ),
    Question(
      questionText: 'يمكن للانسان العيش بدون لحوم ',
      questionImage: 'images/image-5.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'الارض تدور حول الشمس و القمر يدور حول الارض ',
      questionImage: 'images/image-6.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'الحيوانات لا تشعر بالالم ',
      questionImage: 'images/image-7.jpg',
      questionAnswer: false,
    ),
  ];

  void checkAnswer(bool userButtonChoice) {
    bool correctAnswer = questionGroup[questionCount].questionAnswer;
    setState(() {
      if (userButtonChoice == correctAnswer) {
        answerResult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
        correctAnswerCount++;
      } else {
        answerResult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.redAccent,
          ),
        ));
        faultAnswerCount++;
      }

      if (questionCount < questionGroup.length - 1) {
        questionCount++;
      } else {
        endOfQuestion();
        questionCount = 0;
        answerResult = [];
      }
    });
  }

  void endOfQuestion() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Quiz Finished!'),
            content:  Text(
                'You have answered all the questions,and solved $correctAnswerCount of 7'),
            actions: [
              Expanded(
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MainHome()));
                        },
                        child: const Text('CLOSE')),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('START')),
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'EXAM',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Colors.lightGreen,
                letterSpacing: 5),
          ),
        ),
        titleSpacing: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: answerResult,
              ),
              const SizedBox(height: 10),
              Image.asset(questionGroup[questionCount].questionImage),
              const SizedBox(height: 10),
              Text(
                questionGroup[questionCount].questionText,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.pink),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: const Text('True')),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: const Text('False')),
            ],
          ),
        ),
      ),
    );
  }
}
