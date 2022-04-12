// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsappwassim/const.dart';
import 'package:newsappwassim/model.dart';
import 'package:newsappwassim/news_api.dart';
import 'package:newsappwassim/news_screen.dart';
import 'package:newsappwassim/sportscreen/sport_screen.dart';
import 'package:newsappwassim/santescreen/sante_screen.dart';
import 'package:newsappwassim/sciencescreen/science_screen.dart';
import 'package:newsappwassim/techscreen/tech_screen.dart';
import 'package:newsappwassim/entertainementscreen/ent_screen.dart';
import 'package:newsappwassim/businesscreen/biz_screen.dart';

import 'package:newsappwassim/messageac.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:newsappwassim/user_page.dart';


import 'package:google_fonts/google_fonts.dart';

import 'package:newsappwassim/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final Size size = MediaQuery.of(context).size;
   

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
                    icon: Image.asset("image/pngegg.png"),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                Text("Wassim News App v1.2",
                    style: GoogleFonts.poppins(
                        fontSize: 15, color: Colors.black)),
              ],
            )),
        titleSpacing: 0,
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              ExpansionTile(
                title: Text(
                  'Général',
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Sport',
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const SportScreen())),
                  ),
                  ListTile(
                    title: Text(
                      'Santé',
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const SanteScreen())),
                  ),
                  ListTile(
                    title: Text(
                      'Science',
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const ScienceScreen())),
                  ),
                  ListTile(
                    title: Text(
                      'Tech',
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const TechScreen())),
                  ),
                  ListTile(
                    title: Text(
                      'Business',
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const BizScreen())),
                  ),
                  ListTile(
                    title: Text(
                      'Entertainement',
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const EntScreen())),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const WelcomeWidget(),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              isLoading
                  ? SizedBox(
                      height: size.height / 20,
                      width: size.height / 20,
                      child: const CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: newsList!.length,
                        itemBuilder: (context, index) {
                          return listItems(size, newsList![index]);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItems(Size size, NewsApiModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReadingNews(
              model: model,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: size.width / 1.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          child: Column(
            children: [
              Container(
                //le container de mon image
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: model.imageUrl != ""
                    ? Image.network(
                        model.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : const Text("Impossible de charger"),
              ),
              Container(
                //le container de mon titre
                width: size.width / 1.1,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  model.title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                  //Mon container pour la partie date de publication en bas à droite
                  width: size.width / 1.1,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ("Auteur: ") + getTruncatedContent(model.author, 20),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(
                        ("Publié le ") +
                            getTruncatedContent(model.publishedAt, 10),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  //ici je fais ma fonction getTruncatedContent afin de cacher la fin du texte trop conséquent par rapport à mon container
  //si la longueur de mon text est supérieur au chiffre que j'indique alors le texte sera caché + j'ajoute "..." afin de montrer que le texte continue
  String getTruncatedContent(String text, int truncatedNumber) {
    return text.length > truncatedNumber
        ? text.substring(0, truncatedNumber) + "..."
        : text;
  }
}

//mon drawer = ma sidebar

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context)  =>  Drawer(
    
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
Widget buildHeader(BuildContext context) {
      final user = FirebaseAuth.instance.currentUser!;
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
                user.email ?? "pas de mail ",
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
