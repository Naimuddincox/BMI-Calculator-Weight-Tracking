import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../all_types_of_component/bottom_button.dart';
import '../all_types_of_component/icon_button.dart';
import '../all_types_of_component/refillable_card.dart';
import '../all_types_of_component/refillable_icon_and_text.dart';
import '../calculation.dart';
import '../constants.dart';
import 'output_screen.dart';



enum Gender { male, female }

class InputScreen extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputScreen> {
  Gender? selectedGender;
  int textHeight = 180;
  int weight = 65;
  int age = 18;

  Widget buildGenderCard(Gender gender, IconData icon, String label) {
    return Expanded(
      child: RefillableCard(
        onPress: () {
          setState(() {
            selectedGender = gender;
          });
        },
        colour: selectedGender == gender
            ? kActiveCardColor
            : kInActiveCardColor,
        cardChild: RefillableIconAndText(
          iconBoth: icon,
          textBoth: label,
        ),
      ),
    );
  }

  Widget buildSliderCard(String label, int value, ValueChanged<double> onChanged) {
    return Expanded(
      child: RefillableCard(
        onPress: () {},
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: kStyleText),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(value.toString(), style: kNumberStyle),
                Text('cm', style: kStyleText),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Color(0xFF8D8E98),
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 22),
              ),
              child: Slider(
                value: value.toDouble(),
                min: 120,
                max: 220,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        colour: kActiveCardColor,
      ),
    );
  }

  Widget buildWeightAgeCard(String label, int value, Function onDecrement, Function onIncrement) {
    return Expanded(
      child: RefillableCard(
        onPress: () {},
        colour: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: kStyleText),
            Text(value.toString(), style: kNumberStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () => onDecrement(),
                ),
                SizedBox(width: 15),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () => onIncrement(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                buildGenderCard(Gender.male, FontAwesomeIcons.mars, 'MALE'),
                buildGenderCard(Gender.female, FontAwesomeIcons.venus, 'FEMALE'),
              ],
            ),
          ),
          buildSliderCard('HEIGHT', textHeight, (double newValue) {
            setState(() {
              textHeight = newValue.round();
            });
          }),
          Expanded(
            child: Row(
              children: [
                buildWeightAgeCard('WEIGHT', weight, () {
                  setState(() {
                    weight--;
                  });
                }, () {
                  setState(() {
                    weight++;
                  });
                }),
                buildWeightAgeCard('AGE', age, () {
                  setState(() {
                    age--;
                  });
                }, () {
                  setState(() {
                    age++;
                  });
                }),
              ],
            ),
          ),
          BottomButton(
            textBottom: 'CALCULATE',
            onTap: () {
              CalculatorBrain cal = CalculatorBrain(weight: weight, height: textHeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OutputScreen(
                    bmiResult: cal.calculateBMI(),
                    textResult: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}