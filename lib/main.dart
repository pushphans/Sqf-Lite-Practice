import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_practice_flutter/presentation/pages/home.dart';
import 'package:sqflite_practice_flutter/presentation/providers/database_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => Home()},
    );
  }
}
