import 'package:dyvision/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:dyvision/theme/colors.dart';
import 'package:dyvision/modals/study_option_dialog.dart';

class LessonsPage extends StatefulWidget {
  LessonsPage({Key key}) : super(key: key);

  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          elevation: 1,
          color: Theme.of(context).cardColor,
          child: ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.only(left: 15),
            leading: Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: DyColors.primary,
              ),
            ),
            trailing: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Icon(Icons.keyboard_arrow_down),
            ),
            title: Text(
              "English",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            subtitle: Text(
              "PONS beginners book",
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            Material(
              color: Theme.of(context).cardColor,
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Unit 1",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StudyOptionDialog(
                              languages: [
                                Language(title: "German", iso: "DE"),
                                Language(title: "English", iso: "EN"),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Study",
                            style: TextStyle(
                              color: DyColors.primary,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
