import 'package:flutter/material.dart';
import 'package:top_flutter_repositories_bs23_task/api_calls.dart';
import 'package:top_flutter_repositories_bs23_task/models/repos_model.dart';
import 'package:top_flutter_repositories_bs23_task/pages/details_page.dart';

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
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, DetailsPage.routeName,
                                arguments: model.items![index].id);
                            print(model.items![index].id);
                          },
                          title: Text(model.items![index].name!),
                          subtitle: Text(model.items![index].description!),
                          // leading: Text(model.items![index].htmlUrl!),
                          trailing: Text(
                              "Star : ${model.items![index].stargazersCount.toString()}"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
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
