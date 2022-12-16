import 'package:flutter/material.dart';
import 'package:stack_board_item_set/stack_board_item_set.dart';
import 'package:stack_board_item_set/stack_case.dart';
import 'package:stack_board_item_set/stack_items.dart';

class DrawCase extends StatefulWidget {
  const DrawCase({super.key});

  @override
  State<DrawCase> createState() => _DrawCaseState();
}

class _DrawCaseState extends State<DrawCase> {
  StackItemStatus _itemStatus = StackItemStatus.idle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomRight,
      children: <Widget>[
        StackDrawCase(
          item: StackDrawItem(
            status: _itemStatus,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(onPressed: () {
            if (_itemStatus == StackItemStatus.idle) {
              _itemStatus = StackItemStatus.editing;
              setState(() {});
            } else {
              _itemStatus = StackItemStatus.idle;
              setState(() {});
            }
          }),
        ),
      ],
    );
  }
}
