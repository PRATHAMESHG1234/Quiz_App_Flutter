import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuizApp(),
    );
  }
}

class SingleQuestionModel {
  final String? question;
  final List? options;
  final int? correctAns;

  const SingleQuestionModel({this.question, this.options, this.correctAns});
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List allQuetionsList = [
    const SingleQuestionModel(
        question: "who is the founder of apple?",
        options: ["Steve Jobs", "Bill Gates", "Tim Cook", "Mark Zuckerberg"],
        correctAns: 0),
    const SingleQuestionModel(
      question: "What is the capital city of Australia?",
      options: ["Delhi", "Sydney", "Canberra", "Melbourne"],
      correctAns: 1,
    ),
    const SingleQuestionModel(
      question: "What is the capital city of India?",
      options: ["Delhi", "Sydney", "Canberra", "Melbourne"],
      correctAns: 0,
    ),
    const SingleQuestionModel(
      question: "What is the capital city of Maharashtra?",
      options: ["Delhi", "Sydney", "Mumbai", "Melbourne"],
      correctAns: 2,
    ),
    const SingleQuestionModel(
      question: "What is the capital city of us?",
      options: ["california", "Sydney", "Canberra", "Melbourne"],
      correctAns: 0,
    ),
  ];
  int questionIndex = 0;
  bool isQuestionScreen = true;
  int selectedAnsIndex = -1;
  int score = 0;

  MaterialStateProperty<Color?>? checkAns(int buttonIndex) {
    if (selectedAnsIndex != -1) {
      if (buttonIndex == selectedAnsIndex) {
        if (selectedAnsIndex == allQuetionsList[questionIndex].correctAns) {
          score++;
          return const MaterialStatePropertyAll(Colors.green);
        } else {
          return const MaterialStatePropertyAll(Colors.red);
        }
      } else {
        if (buttonIndex == allQuetionsList[questionIndex].correctAns) {
          return const MaterialStatePropertyAll(Colors.green);
        }
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
    return null;
  }

  Scaffold questionScreen() {
    if (isQuestionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.orange),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Question: ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Text(
                "${questionIndex + 1}/${allQuetionsList.length}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text("${allQuetionsList[questionIndex].question}"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (selectedAnsIndex == -1) {
                  selectedAnsIndex = 0;
                }
              });
            },
            style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(370, 0)),
                backgroundColor: checkAns(0)),
            child: Text("${allQuetionsList[questionIndex].options[0]}"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (selectedAnsIndex == -1) {
                  selectedAnsIndex = 1;
                }
              });
            },
            style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(370, 0)),
                backgroundColor: checkAns(1)),
            child: Text("${allQuetionsList[questionIndex].options[1]}"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (selectedAnsIndex == -1) {
                  selectedAnsIndex = 2;
                }
              });
            },
            style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(370, 0)),
                backgroundColor: checkAns(2)),
            child: Text("${allQuetionsList[questionIndex].options[2]}"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (selectedAnsIndex == -1) {
                  selectedAnsIndex = 3;
                }
              });
            },
            style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(370, 0)),
                backgroundColor: checkAns(3)),
            child: Text("${allQuetionsList[questionIndex].options[3]}"),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (selectedAnsIndex != -1) {
                selectedAnsIndex = -1;
                questionIndex++;
              }
              if (questionIndex == allQuetionsList.length) {
                setState(() {
                  isQuestionScreen = false;
                });
              }
            });
          },
          child: const Text("next"),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "QuizApp",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.orange),
            ),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "https://media.istockphoto.com/id/1368531657/vector/congratulations-colorful-typography-banner.jpg?s=612x612&w=0&k=20&c=wLDsEtMDLracjmXSWOownzagyurdZH-lXlNLmZXWsVM=",
                height: 200,
                width: double.infinity,
              ),
              Text("You have Scored $score/${allQuetionsList.length} points"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isQuestionScreen = true;
                      selectedAnsIndex = -1;
                      score = 0;
                      questionIndex = 0;
                    });
                  },
                  child: const Text("reset")),
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return questionScreen();
  }
}
