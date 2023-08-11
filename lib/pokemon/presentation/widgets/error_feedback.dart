import 'package:flutter/material.dart';

class FeedbackError extends StatelessWidget {
  final String content;

  const FeedbackError({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Icon(
            Icons.error_outline,
            size: 100.0,
            color: Colors.red[100],
          ),
        ),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
