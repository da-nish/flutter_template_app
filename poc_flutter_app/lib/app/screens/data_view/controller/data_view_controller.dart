// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poc_flutter_app/app/core/data/local_data/provider/auth_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_view_controller.g.dart';

class DataViewState {
  final String data;

  DataViewState({required this.data});


  factory DataViewState.initial(){
    return DataViewState(data: "");
  }

  DataViewState copyWith({
    String? data
  }) {
    return DataViewState(
      data: data ?? this.data,
    );
  }

}

@riverpod
class DataviewController extends _$DataviewController {

  @override
  DataViewState build() {
    debugPrint("calling. 0");

    return DataViewState.initial();
  }


  final store = AuthLocalStorage();

  void setData() async{
    await store.setToken("AAAA");
  }

  void getData() async{
    final result = await store.getToken();
    debugPrint("===> $result");
  }

  Future<void> contains() async {
    final result = await store.contains();
    debugPrint("===> $result");
  }

  Future<void> remove() async {
    await store.remove();
  }
}
