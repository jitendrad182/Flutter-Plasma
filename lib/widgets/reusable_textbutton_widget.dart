import 'package:flutter/material.dart';

class ReusableTextButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;
  final Color buttonColor;

  ReusableTextButton({
    @required this.buttonTitle,
    @required this.buttonColor,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: buttonColor),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
