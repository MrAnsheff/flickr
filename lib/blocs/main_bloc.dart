import 'package:flicr/models/item_model.dart';
import 'package:flicr/resources/resources.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc {
  final repository = Resources();
  final _listIn = PublishSubject<List<dynamic>>();
  final _listOut = BehaviorSubject<List<ItemModel>>();

  Stream<List<ItemModel>> get listOut => _listOut.stream;

  Function(List<dynamic>) get liker => _listIn.sink.add;

  MainBloc() {
    _listIn.stream.transform(_listTransformer()).pipe(_listOut);
  }

  fetchItems() async {
    final List<dynamic> count = await repository.fetchItems();
    _listIn.sink.add(count);
  }

  _listTransformer() {
    return ScanStreamTransformer(
      (List<ItemModel> cache, List<dynamic> itemsList, int index) {
        if (itemsList.length == 1) {
          cache[itemsList[0]].liked = !cache[itemsList[0]].liked;
          return cache;
        }

        cache = List<ItemModel>.from(itemsList);

        return cache;
      },
      <ItemModel>[],
    );
  }

  void dispose() {
    _listIn.close();
    _listOut.close();
  }
}
