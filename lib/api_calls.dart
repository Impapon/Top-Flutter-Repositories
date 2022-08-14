import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:top_flutter_repositories_bs23_task/models/repos_model.dart';

Future<repo> fetchRepo() async {
  final response = await http.get(Uri.parse(
      'https://api.github.com/search/repositories?q={flutter}{&page,per_page,sort,order}/'));

  if (response.statusCode == 200) {
    return repo.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load repo');
  }
}
