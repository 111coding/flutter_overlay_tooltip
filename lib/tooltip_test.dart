import 'package:flutter/material.dart';
import 'package:flutter_application_1/tooltip_util.dart';

class TooltipTest extends StatefulWidget {
  const TooltipTest({Key? key}) : super(key: key);

  @override
  State<TooltipTest> createState() => _TooltipTestState();
}

class _TooltipTestState extends State<TooltipTest> {
  void copyFn() {
    TooltipUtil.showTooltip(parentKey: k);
  }

  GlobalKey k = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (d) => copyFn(),
      child: Container(
        key: k,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Click",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
