import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flicr/models/item_model.dart';
import 'package:flicr/const/const.dart';
import 'package:flicr/resources/resources.dart';

class ApiProvider implements Source {
  Future<List<dynamic>> fetchItems() async {
    return await http.get(FLICKR_ADDR).then((res) {
      List<dynamic> itemList = json
          .decode(res.body)["items"]
          .map((itemJson) => ItemModel.fromJson(itemJson))
          .toList();

      return itemList;
    });
  }
}
