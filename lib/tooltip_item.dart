import 'package:flutter/material.dart';

class TooltipItem extends StatelessWidget {
  const TooltipItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 테마 상속받기, 오버레이는 부모뷰와 독립적인 형태이기 때문에 테마를 받아와야 글자 밑줄이 생긴다던지 하는 현상 안생김
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Copied Text",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
