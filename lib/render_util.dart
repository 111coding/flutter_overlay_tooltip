import 'package:flutter/material.dart';

class RenderUtil {
  /// 현재 랜더링되어있는 위젯의 위치와 사이즈 정보 리턴
  static WidgetRenderInfo getWidgetRenderInfo({required GlobalKey widgetKey}) {
    final RenderBox renderBox = widgetKey.currentContext?.findRenderObject() as RenderBox;
    Offset globalPosition = renderBox.localToGlobal(Offset.zero);
    Size widgetSize = renderBox.size;
    return WidgetRenderInfo(globalPosition: globalPosition, widgetSize: widgetSize);
  }
}

/// 현재 랜더링되어있는 위젯의 위치와 사이즈 정보
class WidgetRenderInfo {
  WidgetRenderInfo({required this.globalPosition, required this.widgetSize});
  final Offset globalPosition;
  final Size widgetSize;
}
