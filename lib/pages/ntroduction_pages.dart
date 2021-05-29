import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:plasma/pages/opening_page.dart';
import 'package:plasma/utilities/const.dart';

class IntroductionPages extends StatefulWidget {
  @override
  _IntroductionPagesState createState() => _IntroductionPagesState();
}

class _IntroductionPagesState extends State<IntroductionPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            decoration: PageDecoration(imageFlex: 2),
            image: Lottie.asset('assets/lottie/home.json'),
            title: 'STAY HOME STAY SAFE SAVE LIVES',
            body: 'To break the chain of COVID - 19',
          ),
          PageViewModel(
            image: Lottie.asset('assets/lottie/rebound.json'),
            title: 'STOPPING THE SPREAD STARTS WITH YOU',
            body:
                'Get vaccinated.\nWear a mask.\nClean your hands.\nMaintain safe distance.',
          ),
          PageViewModel(
              decoration: PageDecoration(imageFlex: 2),
              image: Lottie.asset('assets/lottie/doc.json'),
              title: 'THANK YOU TO ALL HEALTHCARE WORKERS',
              body:
                  "Fighters are not always on border you can find them in hospital's too")
        ],
        done: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: kButtonColor, borderRadius: BorderRadius.circular(12)),
          child: Text(
            'Start',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        next: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: kButtonColor, borderRadius: BorderRadius.circular(12)),
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        onDone: () {
          Get.to(OpeningPage());
        },
      ),
    );
  }
}
