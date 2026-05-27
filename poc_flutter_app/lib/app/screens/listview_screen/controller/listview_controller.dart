// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poc_flutter_app/app/core/network/model/user_list_model.dart';
import 'package:poc_flutter_app/app/screens/listview_screen/repository/listview_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'listview_controller.g.dart';

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

@riverpod
class ListviewController extends _$ListviewController {

  final RepositoryI dataRepo = ListviewRepositoryI();

  @override
  ListViewState build() {
    debugPrint("calling. 0");
    Future.microtask(() => loadItems());

    return ListViewState.initial();
  }


  Future<void> loadItems() async{
    debugPrint("====> loading items");

    // if(state.loading) return;
    state = state.copyWith(loading: true);
    await Future.delayed(Duration(seconds: 0), (){
      state = state.copyWith(items: [], loading: false);
    });

    

    // await dataRepo.getClient<ClientModel>(
    //   parser: (json) => ClientModel.fromJson(json),
    //   body: {
    //     "grant_type": "client_credentials",
    //     "client_id":"9e5185cb-7814-4a23-81f7-a30d67806967",
    //     "client_secret": "FE0Sy3yDY3J4mOZMszHqyYPqSKGDLQvuioIPwvxC",
    //     "scope": ""
    //   },
    //   onSuccess: (p0) {
    //     state = state.copyWith(loading: false);
    //   },
    //   onError: (p0){
    //     print("fail");
    //   }
    // );

    // await dataRepo.getUserlist<List<UserList>>(
    //   parser: (json){
    //     return (json as List).map((e) => UserList.fromJson(e)).toList();
    //   },
    //   onSuccess: (p0) {
    //     state = state.copyWith(items: p0.data, loading: false);
    //   },
    //   onError: (p0){
    //     print("fail");
    //   }
    // );

    // await dataRepo.getUser<UserList>(
    //   parser: (json){
    //     return UserList.fromJson(json);
    //   },
    //   onSuccess: (p0) {
    //     state = state.copyWith(items: [p0.data!], loading: false);
    //   },
    //   onError: (p0){
    //     print("fail");
    //   }
    // );


    await dataRepo.failRequest<UserList>(
      parser: (json){
        return UserList.fromJson(json);
      },
      onSuccess: (p0) {
        state = state.copyWith(items: [p0.data!], loading: false);
      },
      onError: (p0){
        debugPrint("fail");
      }
    );
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
