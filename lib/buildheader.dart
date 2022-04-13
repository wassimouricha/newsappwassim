// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:newsappwassim/user_page.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// //le widget du header du drawer/sidebar

// // ignore: camel_case_types
// class buildheader extends StatelessWidget {
//   const buildheader({Key? key}) : super(key: key);
//   get user => FirebaseAuth.instance.currentUser; //j'appelle ici l'authentification Firebase
//   @override
//   Widget build(BuildContext context) {
//      if( user == true){
//          return Material(
//       color: Colors.black,
//       child: InkWell(
//         onTap: () {
//           //pour fermer le navigation drawer
//           Navigator.pop(context);
//           //pour rediriger vers la page
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => const UserPage(),
//           ));
//         },
//         child: Container(
//           padding: EdgeInsets.only(
//             top: 24 + MediaQuery.of(context).padding.top,
//             bottom: 24,
//           ),
//           child: Column(
//             children: [
//               const CircleAvatar(
//                 radius: 52,
//                 backgroundImage: NetworkImage(
//                     'https://media-exp1.licdn.com/dms/image/D4E03AQHKyal9OiD12g/profile-displayphoto-shrink_800_800/0/1648624925960?e=2147483647&v=beta&t=NimRdFpaBcn7mrK3Abem2USfCRhEsZ8K7-h8NAQ9xYY'),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
             
//               Text(
//                 "Nom de l'utilisateur",
//                 style: GoogleFonts.poppins(fontSize: 25, color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Text(
//                 "mail ",
//                 style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//      }
   
//   }
// }
