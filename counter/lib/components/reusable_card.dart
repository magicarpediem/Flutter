import 'package:counter/util/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({@required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) => Ink(
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 4,
            color: kBorderColor,
          ),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onTap: onPress,
          child: cardChild,
        ),
      );
}
