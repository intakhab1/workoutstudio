import 'package:workoutstudio/data/exercise_list.dart';
import 'package:workoutstudio/services/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workoutstudio/screens/mainhome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  await DB.init();

  for (var e in exercises) {
    var ex = await DB.getExercise(e.id);
    if (ex.isEmpty) {
      DB.insertExercise(e);
      print(e.name);
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainScreen(),
    );
  }
}
