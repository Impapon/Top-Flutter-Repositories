import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_flutter_repositories_bs23_task/pages/details_page.dart';
import 'package:top_flutter_repositories_bs23_task/pages/home_page.dart';
import 'package:top_flutter_repositories_bs23_task/providers/items_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ItemsProvider()..getAllItems()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        DetailsPage.routeName: (_) => DetailsPage(),
      },
    );
  }
}
