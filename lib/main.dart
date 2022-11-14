import 'package:flutter/material.dart';
import 'package:flutter_dio_example/misc/colors.dart';
import 'package:flutter_dio_example/screens/all_posts_screen/all_posts_screen.dart';
import 'package:flutter_dio_example/screens/home_screen/home_screen.dart';
import 'package:flutter_dio_example/screens/post_screen/post_screen.dart';
import 'package:flutter_dio_example/services/api_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: AppColors.primaryColor,
        ),
        routes: {
          '/': (context) => const HomeScreen(),
          '/all-posts': (context) => const AllPostsScreen(),
          '/post': (context) => const PostScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
