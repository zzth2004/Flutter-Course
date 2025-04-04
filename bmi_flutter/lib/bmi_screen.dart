import 'package:bmi_flutter/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int _genderCurrent = 1;
  double _heightCurrent = 150;
  int _weightCurrent = 30;
  int _ageCurrent = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _genderButton(
                    value: 1,
                    isSelected: _genderCurrent == 1,
                    onTap: () {
                      setState(() {
                        _genderCurrent = 1;
                      });
                    },
                  ),
                  _genderButton(
                    value: 2,
                    isSelected: _genderCurrent == 2,
                    onTap: () {
                      setState(() {
                        _genderCurrent = 2;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _heightSlider(
                currentHeight: _heightCurrent,
                onChanged: (value) {
                  setState(() {
                    _heightCurrent = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _upDownValueWidget(
                    label: "WEIGHT",
                    valueCurrent: _weightCurrent,
                    maxValue: 150,
                    minValue: 15,
                    onUp: (value) {
                      setState(() {
                        _weightCurrent = value;
                      });
                    },
                    onDown: (value) {
                      setState(() {
                        _weightCurrent = value;
                      });
                    },
                  ),
                  _upDownValueWidget(
                    label: "AGE",
                    minValue: 10,
                    maxValue: 120,
                    valueCurrent: _ageCurrent,
                    onUp: (value) {
                      setState(() {
                        _ageCurrent = value;
                      });
                    },
                    onDown: (value) {
                      setState(() {
                        _ageCurrent = value;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => BmiResultScreen(
                        ageCurrent: _ageCurrent,
                        genderCurrent: _genderCurrent,
                        heightCurrent: _heightCurrent,
                        weightCurrent: _weightCurrent,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _upDownValueWidget(
      {required String label,
      required Function(int value) onUp,
      required Function(int value) onDown,
      required int valueCurrent,
      required int minValue,
      required int maxValue}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 10,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Text(
            valueCurrent.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () {
                    if (valueCurrent == minValue) return;
                    onDown(valueCurrent - 1);
                  },
                  icon: const Icon(
                    CupertinoIcons.minus,
                  ),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                    onPressed: () {
                      if (valueCurrent == maxValue) return;
                      onUp(valueCurrent + 1);
                    },
                    icon: const Icon(CupertinoIcons.plus),
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _heightSlider(
      {required void Function(double value)? onChanged,
      required double currentHeight}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const Text(
            "HEIGHT",
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currentHeight.toStringAsFixed(0),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              const Text(
                "cm",
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
          Slider(
            value: currentHeight,
            min: 110,
            max: 280,
            divisions: 210,
            // Mỗi mức tăng 1cm
            label: "${currentHeight.toStringAsFixed(0)} cm",
            onChanged: onChanged,
            thumbColor: Colors.red,
            activeColor: Colors.white70,
          )
        ],
      ),
    );
  }

  Widget _genderButton(
      {required int value, Function()? onTap, required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 10,
        decoration: BoxDecoration(
            color: isSelected ? Colors.white12 : Colors.white10,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            children: [
              Image.asset(
                "assets/gender$value.png",
                width: MediaQuery.of(context).size.width / 6,
                fit: BoxFit.cover,
                color: isSelected ? Colors.white : Colors.white70,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                value == 1 ? "FEMALE" : "MALE",
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
