import 'package:flutter/material.dart';
import 'package:stack_board_item/stack_board_item.dart';
import 'package:stack_board_items/src/items/stack_text_item.dart';

class StackItemCase extends StatelessWidget {
  const StackItemCase({
    Key? key,
    required this.item,
  }) : super(key: key);

  final StackTextItem item;

  TextItemContent? get content => item.content;

  @override
  Widget build(BuildContext context) {
    return item.status == StackItemStatus.editing ? _buildEditing(context) : _buildNormal(context);
  }

  /// Text
  Widget _buildNormal(BuildContext context) {
    return Text(
      content?.data ?? '',
      style: content?.style,
      strutStyle: content?.strutStyle?.style,
      textAlign: content?.textAlign,
      textDirection: content?.textDirection,
      locale: content?.locale,
      softWrap: content?.softWrap,
      overflow: content?.overflow,
      textScaleFactor: content?.textScaleFactor,
      maxLines: content?.maxLines,
      semanticsLabel: content?.semanticsLabel,
      textWidthBasis: content?.textWidthBasis,
      textHeightBehavior: content?.textHeightBehavior,
      selectionColor: content?.selectionColor,
    );
  }

  /// TextFormField
  Widget _buildEditing(BuildContext context) {
    return TextFormField(
      initialValue: content?.data,
      style: content?.style,
      strutStyle: content?.strutStyle?.style,
      textAlign: content?.textAlign ?? TextAlign.start,
      textDirection: content?.textDirection,
      maxLines: content?.maxLines,
    );
  }
}
