
import 'package:poc_flutter_app/core/network/model/test_model.dart';
import 'package:poc_flutter_app/core/network/model/user_list_model.dart';

class ModelRegister {
  static Map<Type, dynamic Function(dynamic)> constructors = {};

  static void registerConstructor<T>(
    T Function(dynamic) callback,
  ) {
    if (constructors[T] == null) constructors[T] = callback;
  }

  static registerModelClasses() {
    registerConstructor<TestModel>((map) => TestModel.fromJson(map));
    registerConstructor<UserList>((map) => UserList.fromJson(map));

    registerConstructor<UserList>((map) => UserList.fromJson(map));
    
  }
}
