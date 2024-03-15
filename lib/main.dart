import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:more_chat/Views/Screens/homepage/screen/home_page.dart';
import 'package:more_chat/Views/Screens/recipe_page/like_page.dart';
import 'package:more_chat/Views/Screens/SplashScreen/splash_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MoreChat());
}

class MoreChat extends StatefulWidget {
  const MoreChat({super.key});

  @override
  State<MoreChat> createState() => _MoreChatState();
}

class _MoreChatState extends State<MoreChat> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Food ",
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Splash()),
        GetPage(name: "/homepage", page: () => HomePage()),
        GetPage(name: "/recipe", page: () => recipeLikedPage()),
      ],
    );
  }
}
