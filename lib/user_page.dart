import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';





class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
  
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text( "Profil : " , style:  GoogleFonts.poppins(fontSize: 17, color: Colors.white), textAlign: TextAlign.center,),
        
      ),
      body:Container(
         margin: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 14),
      child:Column(children: [
        const Padding(padding: EdgeInsets.only(top: 10)),
        const CircleAvatar(
              
                radius: 142,
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/D4E03AQHKyal9OiD12g/profile-displayphoto-shrink_800_800/0/1648624925960?e=2147483647&v=beta&t=NimRdFpaBcn7mrK3Abem2USfCRhEsZ8K7-h8NAQ9xYY'),
              ),
       const SizedBox(
                height: 12,
              ),
              
              Column(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text(
                "Adresse E-mail : ",
                style:  GoogleFonts.poppins(fontSize: 17, color: Colors.black),
              ),
                  const SizedBox(
                width: 12,
              ),
                Text(
                "wbouricha5@gmail.com",
                style:  GoogleFonts.poppins(fontSize: 15, color: Colors.black),
              ),
              
               ElevatedButton(
                                    onPressed: () => FirebaseAuth.instance.signOut(), //la fonction signOut                              
                                              style: ElevatedButton.styleFrom(
                                                shape: const StadiumBorder(),
                                                primary: Colors.black,
                                                padding: const EdgeInsets.all(14),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(width: 10),
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
                          // style: ElevatedButton.styleFrom(
                          //   minimumSize: Size.fromHeight(50),
                          // ),
                          // icon: Icon(Icons.arrow_back,size: 32,),
                          // label: Text('deconnexion' , style: TextStyle(fontSize: 24),
                          // ),
                          // onPressed: () => FirebaseAuth.instance.signOut(),
                          // ),

              ],),
              
      ],)
     ),
          
          

  );
  }
}
