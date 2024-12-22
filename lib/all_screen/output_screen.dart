import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../all_types_of_component/bottom_button.dart';
import '../all_types_of_component/refillable_card.dart';
import '../constants.dart';

class OutputScreen extends StatelessWidget {
  OutputScreen({required this.bmiResult,required this.textResult,required this.interpretation});

  final String bmiResult;
  final String textResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kTitleTextStyle,

              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RefillableCard(
              onPress: (){},
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textResult.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBmiBodyTextStyle,
                  ),

                ],

              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              textBottom: 'RE-CALCULATE YOUR BMI'),
        ],

      ),
    );
  }
}
