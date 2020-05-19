import 'package:dyvision/theme/colors.dart';
import 'package:flutter/material.dart';

class DyBottomAppBar extends StatefulWidget {
  DyBottomAppBar({
    Key key,
    this.items,
    this.onTabSelected,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.selectedIndex,
  }) : super(key: key);

  final List<DyBottomAppBarItem> items;
  final ValueChanged<int> onTabSelected;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final int selectedIndex;

  @override
  _DyBottomAppBarState createState() => _DyBottomAppBarState();
}

class _DyBottomAppBarState extends State<DyBottomAppBar> {
  _updateIndex(int index) {
    widget.onTabSelected(index);
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    DyBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color =
        widget.selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onPressed(index),
        child: SizedBox(
          height: widget.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(item.iconData, color: color, size: widget.iconSize),
              item.text != null
                  ? Text(
                      item.text,
                      style: TextStyle(color: color),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      elevation: 8,
      child: Container(
        height: 55.5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }
}

class DyBottomAppBarItem {
  DyBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}
