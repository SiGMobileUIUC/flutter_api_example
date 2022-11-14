import 'package:flutter/material.dart';
import 'package:flutter_api_example/screens/all_posts_screen/post_card.dart';
import 'package:flutter_api_example/services/api_service.dart';
import 'package:flutter_api_example/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<ApiService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Screen'),
      ),
      body: FutureBuilder(
        future: apiService.getPosts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (_, index) => PostCard(post: snapshot.data![index]),
                itemCount: snapshot.data!.length,
              );
            } else {
              return const Center(child: Text('Error encountered'));
            }
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
