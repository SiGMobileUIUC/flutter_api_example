import 'package:flutter/material.dart';
import 'package:flutter_dio_example/models/comment.dart';
import 'package:flutter_dio_example/widgets/spacing_widgets.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  comment.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  comment.email,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const VerticalSpacing(),
            Text(comment.body),
          ],
        ),
      ),
    );
  }
}
