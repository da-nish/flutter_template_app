import 'package:poc_flutter_app/app/core/network/model/user_list_model.dart';

class ListViewState {
  final bool loading;
  final List<UserList> items;
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
    List<UserList>? items,
    bool? hasMore,
  }) {
    return ListViewState(
      loading: loading ?? this.loading,
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
    );
  }

}