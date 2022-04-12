import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappwassim/login.dart';
import 'package:newsappwassim/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';





class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
      final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
  
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text( "Profil : " + user.email! , style:  GoogleFonts.poppins(fontSize: 17, color: Colors.white), textAlign: TextAlign.center,),
        
      ),
      body:Container(
         margin: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 14),
      child:Column(children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        CircleAvatar(
              
                radius: 142,
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/D4E03AQHKyal9OiD12g/profile-displayphoto-shrink_800_800/0/1648624925960?e=2147483647&v=beta&t=NimRdFpaBcn7mrK3Abem2USfCRhEsZ8K7-h8NAQ9xYY'),
              ),
       SizedBox(
                height: 12,
              ),
              
              Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text(
                "Adresse E-mail : " + user.email!,
                style:  GoogleFonts.poppins(fontSize: 17, color: Colors.black),
              ),
                  SizedBox(
                width: 12,
              ),
                Text(
                "wbouricha5@gmail.com",
                style:  GoogleFonts.poppins(fontSize: 15, color: Colors.black),
              ),
              
               ElevatedButton(
                                    onPressed: (){}, //la fonction signIn
                                              style: ElevatedButton.styleFrom(
                                                shape: StadiumBorder(),
                                                primary: Colors.black,
                                                padding: EdgeInsets.all(14),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Se déconnecter",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              )),
              ],),
              
      ],)
     ),
          
          

  );
  }
}
