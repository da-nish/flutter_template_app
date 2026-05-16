// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:poc_flutter_app/screens/listview_screen/repository/listview_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'listview_controller.g.dart';

class ListViewState {
  final bool loading;
  final List items;
  final bool hasMore;

  ListViewState({required this.loading, required this.items, required this.hasMore});


  factory ListViewState.initial(){
    return ListViewState(
      loading: false, 
      items: [], 
      hasMore: true
    );
  }

  ListViewState copyWith({
    bool? loading,
    List? items,
    bool? hasMore,
  }) {
    return ListViewState(
      loading: loading ?? this.loading,
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
    );
  }

}

@riverpod
class ListviewController extends _$ListviewController {

  @override
  ListViewState build() {
    print("calling. 0");
    Future.microtask(() => loadItems());

    return ListViewState.initial();
  }


  Future<void> loadItems() async{
    print("calling. 1");
    // if(state.loading) return;
    state = state.copyWith(loading: true);

    final repo = ListviewRepositoryI();
    repo.getDatat(
      
    );

    await Future.delayed(Duration(seconds: 4), (){
      print("calling 222");
      state = state.copyWith(items: localItems, loading: false);
    });
  }


  final List<Map<String, String>> localItems = const [
    {
      'title': 'Apple',
      'subtitle': 'Fresh red apples',
    },
    {
      'title': 'Banana',
      'subtitle': 'Organic bananas',
    },
    {
      'title': 'Orange',
      'subtitle': 'Sweet oranges',
    },
    {
      'title': 'Grapes',
      'subtitle': 'Seedless grapes',
    },
    {
      'title': 'Mango',
      'subtitle': 'Tropical mangoes',
    },
  ];

}
