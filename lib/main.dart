import 'package:flutter/material.dart';
import 'package:finice/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const FiNice());
}

class FiNice extends StatefulWidget {
  const FiNice({super.key});

  @override
  State<FiNice> createState() => _FiNiceState();
}

class _FiNiceState extends State<FiNice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            disabledForegroundColor: Colors.white,
            disabledBackgroundColor: Colors.indigo[200],
          ),
        ),
      ),
    );
  }
}
