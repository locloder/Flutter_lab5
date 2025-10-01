import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_personal_app/app_router.dart';
import 'package:my_personal_app/viewmodels/home_viewmodel.dart';
import 'package:my_personal_app/viewmodels/detail_viewmodel.dart';
import 'package:my_personal_app/viewmodels/github_viewmodel.dart';
import 'package:my_personal_app/models/repositories/user_profile_repository.dart';
import 'package:my_personal_app/models/repositories/github_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<UserProfileRepository>(
          create: (_) => UserProfileRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            repository: Provider.of<UserProfileRepository>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailViewModel(
            repository: Provider.of<UserProfileRepository>(context, listen: false),
          ),
        ),
        
        Provider<GitHubRepository>(
          create: (_) => GitHubRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => GitHubViewModel(
            repository: Provider.of<GitHubRepository>(context, listen: false),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Мій Особистий Додаток',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: appRouter,
    );
  }
}