import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
          color: Color(0xffdef5e2),
        ),
        child: Text(
          "hi welcome to chat ,how can i help you",
        ),
      ),
    );
  }
}
