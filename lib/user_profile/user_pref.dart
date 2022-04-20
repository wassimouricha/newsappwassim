import 'package:newsappwassim/user_profile/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserPreferences {

   get user => FirebaseAuth.instance.currentUser;

  static const myUser = Usered(
      imagePath: "https://media-exp1.licdn.com/dms/image/D4E03AQHKyal9OiD12g/profile-displayphoto-shrink_800_800/0/1648624925960?e=1655942400&v=beta&t=0GamnO5HweztHxHoqhvzWvl7aI1DmJnDZIrAEPKQ5eU",
    
      about: " écrivez votre description",
      isDarkMode: false,

  );
}
