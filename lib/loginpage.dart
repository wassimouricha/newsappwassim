// ignore_for_file: avoid_print, camel_case_types

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

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Login> {
  List<NewsApiModel>? newsList;
  bool isLoading = true;
  var currentIndex = 0;

  void changePage(var index) {
    setState(() {
      currentIndex = index;
    });
  }

  late final List<BubbleBottomBarItem> items;
  @override
  void initState() {
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print("La liste est vide");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: getColors[1],
      appBar: AppBar(
        //ici je code mon app bar qui me redirige vers mon drawer
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Image.asset("image/drawer.png"),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                const Text("Wassim News App v1.2",
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ],
            )),
        titleSpacing: 0,
      ),
      drawer: const NavigationDrawer(),
      body: const connexionPage(),
    );
  }
}

//mon widget de login

class connexionPage extends StatefulWidget {
  const connexionPage({Key? key}) : super(key: key);

  @override
  State<connexionPage> createState() => _connexionPageState();
}

class _connexionPageState extends State<connexionPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

    var _obscureText =
      true; 
 //obscuretext est une propriété qui lorsque elle passe a true obscurcit le champ de texte
//la fonction future sign in ici indique que lorsque qu'on activeras la fonction
   Future signIn() async {
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
            }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    delayedAnimation(
                      delay: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Connectez vous avec votre adresse mail",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 35),
                                                        Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    children: [
                                      delayedAnimation(
                                        delay: 1500,
                                        child: TextField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            labelText: 'Votre mail',
                                            labelStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      delayedAnimation(
                                        delay: 2000,
                                        child: TextField(
                                          controller: passwordController,
                                          obscureText: _obscureText,
                                          decoration: InputDecoration(
                                            labelStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                            labelText: 'Mot de passe',
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          const SizedBox(height: 125),
                          delayedAnimation(
                            delay: 3000,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              height: 200,
                              child: Column(
                                children: [
                                  Text(
                                    "Il est recommandé de connecter votre adresse mail afin que nous puissions protéger vos données personnelles.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 35),
                                  delayedAnimation(
                                    delay: 3500,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 14),
                                      child: Column(children: [
                                        ElevatedButton(
                                            onPressed: signIn, //la fonction signIn
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
                                                  "Confirmer",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
        ));

          
  }
}



//mon drawer = ma sidebar

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      );
}

//le widget du header du drawer/sidebar
Widget buildHeader(BuildContext context) => Material(
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
            children: const [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/D4E03AQHKyal9OiD12g/profile-displayphoto-shrink_800_800/0/1648624925960?e=2147483647&v=beta&t=NimRdFpaBcn7mrK3Abem2USfCRhEsZ8K7-h8NAQ9xYY'),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Wassim Bouricha",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "wbouricha5@gmail.com",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );

//le widget du menu du drawer/sidebar
Widget buildMenuItems(BuildContext context) => Wrap(
  runSpacing: 16, //espace vertical
  children: [
    ListTile(
      leading: const Icon(Icons.home_outlined),
      title: const Text(
          'Accueil'), //je peux remplacement pushreplacement par push pour avoir le bouton en haut a gauche pour revenir
      //il faut cependant ajouter Navigator.pop(context); pour que le drawer se ferme lorsque l'on va revenir sur la page
      onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen())),
    ),
    ListTile(
      leading: const Icon(Icons.favorite_border),
      title: const Text('Notifications'),
      onTap: () {},
    ),
    ListTile(
      leading: const Icon(Icons.login),
      title: const Text('Connexion'),
      onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login())),
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
  ],
);
