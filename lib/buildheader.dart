// ignore_for_file: avoid_print


import 'package:flutter/material.dart';
import 'package:newsappwassim/home_screen.dart';
import 'package:newsappwassim/user_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappwassim/login.dart';


//le widget du header du drawer/sidebar

Widget buildHeader(BuildContext context) {
    
    
  return Material(

      color: Colors.black,
      child: InkWell(
        onTap: () {
          //pour fermer le navigation drawer
          Navigator.pop(context);
          //pour rediriger vers la page
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const UserPage(),
          ));
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 52,
               backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/D4E03AQHKyal9OiD12g/profile-displayphoto-shrink_800_800/0/1648624925960?e=2147483647&v=beta&t=NimRdFpaBcn7mrK3Abem2USfCRhEsZ8K7-h8NAQ9xYY'),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
               "Nom de l'utilisateur",
                style: GoogleFonts.poppins(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                 "mail ",
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
}

//le widget du menu du drawer/sidebar
Widget buildMenuItems(BuildContext context) => Wrap(
  runSpacing: 16, //espace vertical
  children: [
    ListTile(
      leading: const Icon(Icons.home_outlined),
      title: Text(
        'Accueil',
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
      ), //je peux remplacement pushreplacement par push pour avoir le bouton en haut a gauche pour revenir
      //il faut cependant ajouter Navigator.pop(context); pour que le drawer se ferme lorsque l'on va revenir sur la page
      onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen())),
    ),
    ListTile(
      leading: const Icon(Icons.favorite_border),
      title: Text(
        'Notifications',
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
      ),
      onTap: () {},
    ),
    ListTile(
      leading: const Icon(Icons.login),
      title: Text(
        'Connexion',
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
      ),
      onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const loginaid())),
    ),
    InkWell(
      borderRadius: BorderRadius.circular(500),
      splashColor: Colors.black,
      onTap: () {
        //pour fermer le drawer
        Navigator.of(context).pop();
      },
      child: const Center(
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.black,
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    ),
    const Divider(
      color: Colors.black,
    ),
    // Expanded(
    //     child: Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Container(
    //         height: 65,
    //         width: MediaQuery.of(context).size.width,
    //         color: Colors.black,
    //         child: Center(
    //           //premet de mettre l'enfant du widget et donc ce qu'il y à a l'interieur au centre
    //           child: Text(
    //             "v1.0.3",
    //             style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.white),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
  ],
);