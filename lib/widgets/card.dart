import 'package:flutter/material.dart';
import 'package:plasma/utilities/const.dart';

class ReusableCard extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  final String text;
  ReusableCard(
      {@required this.iconData, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
