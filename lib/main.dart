import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzadeeserts/provider/boxadd_provider.dart';
import 'package:pizzadeeserts/provider/favorite_provider.dart';
import 'package:pizzadeeserts/provider/neumorphism_provider.dart';
import 'package:pizzadeeserts/router/router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("pizza");
  await Hive.openBox("desert");
  await Hive.openBox("bascets");

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MultiProvider(
      child: const MyApp(),
      providers: [
        ChangeNotifierProvider(
          create: (context) => NeuMorphismProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BoxAddtoBascet(),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFFE9F3FC),
        ),
        fontFamily: "Ajoyib",
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/first",
      onGenerateRoute: (settings) => GenerateRouterr.routerGenerator(settings),
    );
  }
}
