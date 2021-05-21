import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('About')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(110),
                child: Image.asset(
                  'assets/images/ju.png',
                  height: 110,
                  width: 110,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'PLASMA',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      fontFamily: 'Pacifico'),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'Developed By JECRC University\nTeam : JUMAKERSPACE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
