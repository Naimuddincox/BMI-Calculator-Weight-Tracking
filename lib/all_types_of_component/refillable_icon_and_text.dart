import 'package:flutter/material.dart';

import '../constants.dart';



class RefillableIconAndText extends StatelessWidget {
  RefillableIconAndText({required this.iconBoth,required this.textBoth});
  final IconData iconBoth;
  final String textBoth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconBoth,
            size: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text(textBoth,
            style: kStyleText,


          ),
        ],
      ),
    );
  }
}