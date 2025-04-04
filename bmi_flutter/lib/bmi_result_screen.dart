import 'package:bmi_flutter/bmi_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatefulWidget {
  final int genderCurrent;
  final double heightCurrent;
  final int weightCurrent;
  final int ageCurrent;

  const BmiResultScreen(
      {super.key,
      required this.genderCurrent,
      required this.heightCurrent,
      required this.weightCurrent,
      required this.ageCurrent});

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  late BMIResult bmiResult;

  @override
  void initState() {
    super.initState();
    setState(() {
      bmiResult = tinhBMI(widget.genderCurrent == 1 ? "FEMALE" : "MALE",
          widget.heightCurrent, widget.weightCurrent, widget.ageCurrent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              "Your Result",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              padding: const EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    bmiResult != null ? bmiResult.phanLoai : "Processing...",
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    bmiResult != null
                        ? bmiResult.bmi.toStringAsFixed(1)
                        : "Processing...",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    bmiResult != null
                        ? "Your BMI result is ${bmiResult.phanLoai}"
                        : "Processing...",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
