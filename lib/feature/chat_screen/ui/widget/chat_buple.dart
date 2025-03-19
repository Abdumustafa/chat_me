import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
          color: Color(0xffdef5e2),
        ),
        child: Text(
          message,
        ),
      ),
    );
  }
}

class ChatBubleFriend extends StatelessWidget {
  const ChatBubleFriend({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
          color: Colors.grey.shade200,
        ),
        child: Text(
          message,
        ),
      ),
    );
  }
}
