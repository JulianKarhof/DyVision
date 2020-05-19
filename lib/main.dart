import 'package:dyvision/modals/study_option_dialog.dart';
import 'package:dyvision/views/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:dyvision/theme/colors.dart';
import 'package:dyvision/components/dy_scaffold.dart';

void main() => runApp(DyVision());

class DyVision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DyVision',
      initialRoute: '/',
      routes: {
        '/': (context) => DyScaffold(),
        '/studyoptiondialog': (context) => StudyOptionDialog(),
        '/flashcardview': (context) => FlashcardView(),
      },
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        cardColor: Colors.grey[900],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: DyColors.primary,
        ),
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey[900],
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
        ),
        fontFamily: 'Nunito',
      ),
      theme: ThemeData(
        primaryColor: DyColors.primary,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: DyColors.primary,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
