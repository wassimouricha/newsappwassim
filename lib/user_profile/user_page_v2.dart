import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsappwassim/login.dart';
import 'package:newsappwassim/user_profile/appbar_widget.dart';
import 'package:newsappwassim/user_profile/user_pref.dart';
import 'profile_widget.dart';

class UserPageV2 extends StatefulWidget {
  const UserPageV2({Key? key}) : super(key: key);

  @override
  State<UserPageV2> createState() => _UserPageV2State();
}

class _UserPageV2State extends State<UserPageV2> {
  get user => FirebaseAuth.instance.currentUser;
  final usered = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text("une erreur s'est produite"));
              } else if (snapshot.hasData) {
                return Scaffold(
                    appBar: buildAppBar(context),
                    backgroundColor: Colors.white,
                    body:
                     Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                       child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                        ProfileWidget(
                          imagePath: usered.imagePath,
                          onClicked:() async {},
                        ),
                        const SizedBox(height: 24,),
                         Column(children: [
                           Text(user.email,
                           style:  GoogleFonts.poppins(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),),
                           const SizedBox(height: 4,),
                           Text(user.email, //mettre le nom plus tard
                           style:  GoogleFonts.poppins(color: Colors.grey,),),
                         ]),
                           ElevatedButton(
                            onPressed: () => FirebaseAuth.instance
                                .signOut(), //la fonction signOut
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.black,
                              padding: const EdgeInsets.all(14),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  "Se déconnecter",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )),
                    ],
                    
                  ),
                     ),);
              } else {
                return Scaffold(
                  appBar: buildAppBar(context),
                  body: Container(
                     margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ProfileWidget(
                          imagePath: usered.imagePath,
                          onClicked:() async {},
                        ),
                        const SizedBox(height: 24,),
                         Column(children:  [
                           Text("non connecté",
                           style:  GoogleFonts.poppins(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 4,),
                           Text("non connecté",
                           style:  GoogleFonts.poppins(color: Colors.grey,),),
                         ]),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => const loginaid())),
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.black,
                              padding: const EdgeInsets.all(14),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  "Se Connecter",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              }
            }),
      );


}
