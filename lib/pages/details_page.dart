import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_flutter_repositories_bs23_task/models/repos_model.dart';
import 'package:top_flutter_repositories_bs23_task/providers/items_provider.dart';

class DetailsPage extends StatefulWidget {
  static const String routeName = '/details';

  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late int id;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: Center(
        child: Consumer<ItemsProvider>(
          builder: (context, provider, _) => FutureBuilder<Items>(
            future: provider.getItemsById(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final model = snapshot.data;
                return ListView(
                  children: [
                    // Image.file(
                    //   File(model.owner.avatarUrl),
                    //   width: double.infinity,
                    //   height: 300,
                    //   fit: BoxFit.cover,
                    // ),
                    Text(model!.owner!.id.toString()),
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Text("Failed to fetch data");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
