import 'package:flutter/material.dart';
import 'package:flutter_dio_example/models/post.dart';
import 'package:flutter_dio_example/screens/post_screen/comment_widget.dart';
import 'package:flutter_dio_example/services/api_service.dart';
import 'package:flutter_dio_example/widgets/loading_indicator.dart';
import 'package:flutter_dio_example/widgets/spacing_widgets.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)!.settings.arguments as Post;
    final apiService = Provider.of<ApiService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const VerticalSpacing(),
            Row(
              children: [
                Text('User ID: ${post.userId}'),
                const Spacer(),
                Text('Post ID: ${post.id}'),
              ],
            ),
            const VerticalSpacing(),
            Text(post.body),
            const VerticalSpacing(),
            FutureBuilder(
              future: apiService.getPostComments(postId: post.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        primary: true,
                        shrinkWrap: true,
                        itemBuilder: (_, index) => CommentWidget(comment: snapshot.data![index]),
                        itemCount: snapshot.data!.length,
                      ),
                    );
                  }
                  return Center(
                    child: Text('Error encountered: ${snapshot.error}'),
                  );
                }
                return const LoadingIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
