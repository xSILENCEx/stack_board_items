import 'dart:ui';

import 'package:stack_board_item/stack_board_item.dart';

import 'package:widget_style_extension/widget_style_extension.dart';

class DrawItemContent implements StackItemContent {
  DrawItemContent({
    required this.size,
  });

  factory DrawItemContent.fromJson(Map<String, dynamic> data) {
    return DrawItemContent(
      size: data['size'] as double,
    );
  }

  final double size;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }
}

class StackDrawItem extends StackItem<DrawItemContent> {
  StackDrawItem({
    DrawItemContent? content,
    String? id,
    double? angle,
    Size size = const Size(300, 300),
    Offset? offset,
    StackItemStatus? status,
  }) : super(
          id: id,
          size: size,
          offset: offset,
          angle: angle,
          status: status,
          content: content,
        );

  factory StackDrawItem.fromJson(Map<String, dynamic> data) {
    return StackDrawItem();
  }

  @override
  StackDrawItem copyWith({
    Size? size,
    Offset? offset,
    double? angle,
    StackItemStatus? status,
    DrawItemContent? Function(DrawItemContent oldContent)? contentGenerators,
  }) {
    return StackDrawItem(
      id: id,
      size: size ?? this.size!,
      offset: offset ?? this.offset,
      angle: angle ?? this.angle,
      status: status ?? this.status,
      content: content == null ? null : contentGenerators?.call(content!) ?? content,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'type': 'StackDrawItem',
      if (angle != null) 'angle': angle,
      if (size != null) 'size': size?.toJson(),
      if (offset != null) 'offset': offset?.toJson(),
      if (status != null) 'status': status?.index,
      if (content != null) 'content': content?.toJson(),
    };
  }
}
