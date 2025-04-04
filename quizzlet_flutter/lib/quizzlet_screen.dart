import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzlet_flutter/quizzlet_brain.dart';

List<QuizzletBrain> questions = [
  QuizzletBrain(question: "Trái đất là hình cầu?", result: true),
  QuizzletBrain(question: "Nước sôi ở 50 độ C?", result: false),
  QuizzletBrain(question: "Mặt trời mọc ở hướng đông?", result: true),
  QuizzletBrain(question: "Cá voi là cá?", result: false),
  QuizzletBrain(question: "2 + 2 = 4?", result: true),
  QuizzletBrain(
      question: "Kim cương là dạng thù hình của cacbon?", result: true),
  QuizzletBrain(question: "Chim cánh cụt biết bay?", result: false),
  QuizzletBrain(question: "Con người có 5 giác quan?", result: false),
  QuizzletBrain(question: "Bắc Cực lạnh hơn Nam Cực?", result: false),
  QuizzletBrain(
      question: "Sấm sét được tạo ra bởi sự ma sát của các đám mây?",
      result: true),
  QuizzletBrain(question: "Python là một loại rắn?", result: true),
  QuizzletBrain(
      question: "Mộc tinh là hành tinh lớn nhất trong hệ mặt trời?",
      result: true),
  QuizzletBrain(question: "Màu đỏ là màu nóng?", result: true),
  QuizzletBrain(question: "Bóng đá có 15 cầu thủ trên sân?", result: false),
  QuizzletBrain(
      question: "Con người có thể sống mà không có nước?", result: false),
  QuizzletBrain(
      question: "Động vật có vú đẻ trứng là thú mỏ vịt?", result: true),
  QuizzletBrain(question: "Chó là loài động vật ăn cỏ?", result: false),
  QuizzletBrain(question: "Âm thanh truyền trong chân không?", result: false),
  QuizzletBrain(
      question: "Oxy là nguyên tố phổ biến nhất trong vỏ Trái đất?",
      result: true),
  QuizzletBrain(
      question: "Mèo có thể nhìn thấy trong bóng tối hoàn toàn?",
      result: false),
];

class QuizzletScreen extends StatefulWidget {
  const QuizzletScreen({super.key});

  @override
  State<QuizzletScreen> createState() => _QuizzletScreenState();
}

class _QuizzletScreenState extends State<QuizzletScreen> {
  late QuizzletBrain _questionCurrent;
  int _questionCurrentIndex = 0;

  @override
  void initState() {
    _questionCurrent = questions[_questionCurrentIndex];
  }

  void alertShow(String title) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title),
            ));
  }
  void nextQ(){
    setState(() {
      _questionCurrentIndex += 1;
      _questionCurrent = questions[_questionCurrentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width - 10,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  _questionCurrent.question,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _button(
                      label: "FALSE",
                      onTap: () {
                        alertShow(_questionCurrent.result == false
                            ? "CORRECT"
                            : "INCORRECT");
                        nextQ();
                      },
                      color: Colors.red),
                  _button(
                      label: "TRUE",
                      onTap: () {
                        alertShow(_questionCurrent.result == true
                            ? "CORRECT"
                            : "INCORRECT");
                        nextQ();
                      },
                      color: Colors.green)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _button(
      {required String label,
      required Function() onTap,
      required Color color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
