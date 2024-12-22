import 'package:flutter/material.dart';

import 'all_screen/input_screen.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0d250b),
          scaffoldBackgroundColor: Color(0xff161e38)
      ),
      home: InputScreen(),
    );
  }
}
