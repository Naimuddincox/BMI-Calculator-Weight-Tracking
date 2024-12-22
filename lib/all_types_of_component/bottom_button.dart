
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.textBottom});

  final void Function() onTap;
  final String textBottom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            textBottom,
            style: kBottomLargeStyle,
          ),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        height: kBottomContainerHeight,
      ),
    );
  }
}