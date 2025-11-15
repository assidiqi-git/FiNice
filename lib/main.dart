import 'package:finice/views/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
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
    return MaterialApp(
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
      home: WidgetTree(),
    );
  }
}
