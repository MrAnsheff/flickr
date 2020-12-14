import 'api_provider.dart';

class Resources {
  List<Source> sources = [
    ApiProvider(),
  ];

  Future<List<dynamic>> fetchItems() {
    return sources[0].fetchItems();
  }
}

abstract class Source {
  Future<List<dynamic>> fetchItems();
}
