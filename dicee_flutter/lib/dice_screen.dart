import 'dart:math';

import 'package:dicee_flutter/assets/index.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _dice1 = 1;
  int _dice2 = 1;
  void _random(){
    setState(() {
      _dice1 = Random().nextInt(6) + 1;
      _dice2 = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _diceButton(
                value: _dice1,
                onTap: _random,
              ),
              const SizedBox(
                width: 10,
              ),
              _diceButton(
                value: _dice2,
                onTap: _random,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _diceButton({required int value, required Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        ImagePath.dice1.getDice(value),
        width: MediaQuery.of(context).size.width / 2 - 10,
      ),
    );
  }
}
