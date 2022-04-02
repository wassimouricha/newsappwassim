import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bonjour et bienvenue sur l'application News !",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Informez vous en cliquant sur les articles dans la liste",
            style: TextStyle(fontSize: 10,
            color: Colors.grey[700]),
          )
        ],
      ),
    );
  }
}
