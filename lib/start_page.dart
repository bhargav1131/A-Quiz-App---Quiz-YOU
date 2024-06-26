import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.arg, {super.key});

  final void Function() arg ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255), // for adding transparency
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Learn Flutter the fun way !',
            style: TextStyle(color: Colors.white, fontSize: 21),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: arg,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right),
            label: const Text(
              "Start Quiz",
              // style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
