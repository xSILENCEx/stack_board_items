import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stack_board_item/stack_board_item.dart';
import 'package:stack_board_item_set/src/items/stack_text_item.dart';

class StackTextCase extends StatelessWidget {
  const StackTextCase({
    Key? key,
    required this.item,
    this.decoration,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.textAlignVertical,
    this.controller,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.readOnly = false,
    this.autofocus = true,
    this.obscureText = false,
    this.maxLines,
    this.inputFormatters,
    this.focusNode,
    this.enabled = true,
  }) : super(key: key);

  final StackTextItem item;

  final InputDecoration? decoration;
  final TextEditingController? controller;

  final int? maxLength;

  final TextInputAction? textInputAction;

  final TextAlignVertical? textAlignVertical;

  final TextInputType? keyboardType;

  final Function(String)? onChanged;

  final Function()? onEditingComplete;

  final Function()? onTap;

  final bool readOnly;

  final bool autofocus;

  final bool obscureText;

  final int? maxLines;

  final List<TextInputFormatter>? inputFormatters;

  final FocusNode? focusNode;

  final bool enabled;

  final TextCapitalization textCapitalization;

  TextItemContent? get content => item.content;

  @override
  Widget build(BuildContext context) {
    return item.status == StackItemStatus.editing
        ? _buildEditing(context)
        : _buildNormal(context);
  }

  /// Text
  Widget _buildNormal(BuildContext context) {
    return FittedBox(
      child: Text(
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
      ),
    );
  }

  /// TextFormField
  Widget _buildEditing(BuildContext context) {
    return Center(
      child: TextFormField(
        initialValue: content?.data,
        style: content?.style,
        strutStyle: content?.strutStyle?.style,
        textAlign: content?.textAlign ?? TextAlign.start,
        textDirection: content?.textDirection,
        maxLines: content?.maxLines,
        decoration: decoration,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        textAlignVertical: textAlignVertical,
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus,
        readOnly: readOnly,
        obscureText: obscureText,
        maxLength: maxLength,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        enabled: enabled,
      ),
    );
  }
}
