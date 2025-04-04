import 'package:flutter/material.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key});

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.brown,
    Colors.pink,
    Colors.deepPurple,
  ];
  void playSound(int soundNum) async{
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _noteWidget(colorIndex: 0),
          _noteWidget(colorIndex: 1),
          _noteWidget(colorIndex: 2),
          _noteWidget(colorIndex: 3),
          _noteWidget(colorIndex: 4),
          _noteWidget(colorIndex: 5),
          _noteWidget(colorIndex: 6),
        ],
      ),
    );
  }

  Widget _noteWidget({required int colorIndex}) {
    return GestureDetector(
      onTap: () => playSound(colorIndex),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(color: _colors[colorIndex]),
      ),
    );
  }
}
