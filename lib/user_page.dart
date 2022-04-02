import 'package:flutter/material.dart';





class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(

      appBar: AppBar(
        title: const Text("Wassim Bouricha"),
        
      ),
      body:Container(
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
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text(
                "Adresse E-mail : ",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
                  SizedBox(
                width: 12,
              ),
                Text(
                "wbouricha5@gmail.com",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              ],),
              
      ],)
     ),
          
          

  );
}
