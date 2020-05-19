import 'package:dyvision/classes/classes.dart';
import 'package:dyvision/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dyvision/views/flashcard_view.dart';

class StudyOptionDialog extends StatefulWidget {
  StudyOptionDialog({Key key, this.languages}) : super(key: key);

  final List<Language> languages;

  @override
  _StudyOptionDialogState createState() => _StudyOptionDialogState();
}

class _StudyOptionDialogState extends State<StudyOptionDialog>
    with TickerProviderStateMixin {
  AnimationController _turnAnimationController;
  bool toSecondLanguage = true;

  @override
  void initState() {
    assert(widget.languages.length == 2);
    _turnAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Center(
        child: Text(
          "Flashcard Study",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      contentPadding: EdgeInsets.all(20),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              widget.languages[0].title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  setState(() {
                    toSecondLanguage = !toSecondLanguage;
                  });
                  if (!toSecondLanguage)
                    _turnAnimationController.forward();
                  else
                    _turnAnimationController.reverse();
                },
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.5)
                      .animate(_turnAnimationController),
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      "assets/double_arrow-24px.svg",
                    ),
                  ),
                ),
              ),
            ),
            Text(
              widget.languages[1].title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        Container(
          height: 20,
        ),
        Container(
          child: Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FlashcardView(
                      fromLanguage: widget.languages[toSecondLanguage ? 0 : 1],
                      toLanguage: widget.languages[toSecondLanguage ? 1 : 0],
                    ),
                  ),
                );
              },
              color: DyColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Start",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
