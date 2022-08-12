import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: ListView(
        children: [
          ListTile(
              title: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Filter Top repo..",
                  prefixIcon: Icon(Icons.topic_outlined),
                ),
              ),
              trailing: Icon(Icons.topic_outlined)),
        ],
      ),
    );
  }
}
