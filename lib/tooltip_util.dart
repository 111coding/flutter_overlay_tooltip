import 'package:flutter/material.dart';
import 'package:flutter_application_1/render_util.dart';
import 'package:flutter_application_1/tooltip_item.dart';
import 'package:get/get.dart';

class TooltipUtil {
  static OverlayEntry? _overlayEntry;

  static bool isOpend = false;

  /// delay 전에 또 오버레이 했을때 이전 오버레이의 delay 끝난 후 remove호출안함(이미 호출했기때문)
  static int currentOverEnrtyHashCode = 0;

  static Future showTooltip({required GlobalKey parentKey}) async {
    if (isOpend) {
      _overlayEntry?.remove();
    }
    var renderInfo = RenderUtil.getWidgetRenderInfo(widgetKey: parentKey);

    Widget entryWidget = Stack(
      children: [
        Positioned(
          left: renderInfo.globalPosition.dx,
          top: renderInfo.globalPosition.dy + renderInfo.widgetSize.height, //item
          child: const TooltipItem(),
        )
      ],
    );

    _overlayEntry = OverlayEntry(builder: (context) => entryWidget);
    int overlayEntryHashCode = _overlayEntry.hashCode;
    currentOverEnrtyHashCode = overlayEntryHashCode;
    isOpend = true;
    Overlay.of(Get.overlayContext!)?.insert(_overlayEntry!);
    await Future.delayed(const Duration(milliseconds: 700));
    if (currentOverEnrtyHashCode == overlayEntryHashCode) {
      _overlayEntry?.remove();
      isOpend = false;
    }
  }
}
