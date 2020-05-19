import 'package:dyvision/pages/results_page.dart';
import 'package:dyvision/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:dyvision/classes/classes.dart';
import 'dart:math';

class FlashcardView extends StatefulWidget {
  FlashcardView({Key key, this.fromLanguage, this.toLanguage})
      : super(key: key);

  final Language fromLanguage;
  final Language toLanguage;

  @override
  _FlashcardViewState createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView> {
  List<Vocabulary> _vocabulary = [
    Vocabulary(
      words: [
        Word("Hello", language: Language(title: "English", iso: "EN")),
        Word("Hallo", language: Language(title: "German", iso: "DE")),
      ],
    ),
    Vocabulary(
      words: [
        Word("Morning", language: Language(title: "English", iso: "EN")),
        Word("Morgen", language: Language(title: "German", iso: "DE")),
      ],
    ),
    Vocabulary(
      words: [
        Word("Breakfast", language: Language(title: "English", iso: "EN")),
        Word("Frühstück", language: Language(title: "German", iso: "DE")),
      ],
    ),
  ];

  List<Vocabulary> _randomVocabulary;
  int vocabIndex = 0;

  @override
  void initState() {
    super.initState();
    _randomVocabulary = shuffle(_vocabulary);
  }

  bool showSolution = false;

  List shuffle(List items) {
    var random = new Random();

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    if (vocabIndex == _vocabulary.length) {
      Navigator.of(context).popUntil(
        ModalRoute.withName("/"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 35),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(DyColors.primary),
                  value:
                      (vocabIndex).toDouble() / _vocabulary.length.toDouble(),
                ),
              ),
              Text(
                "$vocabIndex/${_vocabulary.length}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              child: Material(
                elevation: 4,
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      _vocabulary.length != vocabIndex
                          ? _randomVocabulary[vocabIndex]
                              .getWordInLanguage(
                                showSolution
                                    ? widget.toLanguage
                                    : widget.fromLanguage,
                              )
                              .toString()
                          : "",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: "OpenDyslexic",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 100),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Material(
                    color: Colors.white,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 75,
                        width: 75,
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.volume_up,
                          size: 40,
                          color: DyColors.primary,
                        ),
                      ),
                    ),
                  ),
                  if (!showSolution)
                    Material(
                      color: Colors.white,
                      elevation: 4,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showSolution = true;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 75,
                          width: 195,
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.threesixty,
                            size: 40,
                            color: DyColors.primary,
                          ),
                        ),
                      ),
                    ),
                  if (showSolution)
                    Material(
                      color: Colors.white,
                      elevation: 4,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showSolution = false;
                            vocabIndex++;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 75,
                          width: 75,
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.close,
                            size: 40,
                            color: DyColors.primary,
                          ),
                        ),
                      ),
                    ),
                  if (showSolution)
                    Material(
                      color: Colors.white,
                      elevation: 4,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showSolution = false;
                            vocabIndex++;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 75,
                          width: 75,
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.check,
                            size: 40,
                            color: DyColors.primary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
