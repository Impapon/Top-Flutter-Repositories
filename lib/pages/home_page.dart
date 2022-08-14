import 'package:flutter/material.dart';
import 'package:top_flutter_repositories_bs23_task/api_calls.dart';
import 'package:top_flutter_repositories_bs23_task/models/repos_model.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<repo> futureRepo;

  @override
  void initState() {
    super.initState();
    futureRepo = fetchRepo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Center(
        child: FutureBuilder<repo>(
          future: futureRepo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final model = snapshot.data;
              return ListView.builder(
                  itemCount: model!.items!.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 5,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model.items![index].name!),
                            Text(model.items![index].htmlUrl!),
                            Text(model.items![index].description!),
                          ],
                        ),
                      ));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
