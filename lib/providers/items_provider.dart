import 'package:flutter/material.dart';
import 'package:top_flutter_repositories_bs23_task/db/db_helper.dart';
import 'package:top_flutter_repositories_bs23_task/models/repos_model.dart';

class ItemsProvider extends ChangeNotifier {
  List<Items> itemList = [];

  getAllItems() async {
    itemList = await DbHelper.getAllItems();
    notifyListeners();
  }

  Future<Items> getItemsById(int id) => DbHelper.getItemsById(id);

  Future<bool> insertItems(Items items) async {
    final rowId = await DbHelper.insertItems(items);
    if (rowId > 0) {
      items.id = rowId;
      itemList.add(items);
      // itemList.sort((c1, c2) => c1.name.compareTo(c2.name));
      notifyListeners();
      return true;
    }
    return false;
  }
}
