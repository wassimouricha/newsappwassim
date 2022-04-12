import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsappwassim/const.dart';
import 'package:newsappwassim/model.dart';
import 'package:newsappwassim/news_api.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:newsappwassim/user_page.dart';
import 'package:newsappwassim/home_screen.dart';
import 'package:newsappwassim/delayed_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:newsappwassim/loginpage.dart';

class loginaid extends StatelessWidget {
  const loginaid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(

    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return HomeScreen();
        }else{
          return Login();
        }
        
      }
    ),
  );
}
