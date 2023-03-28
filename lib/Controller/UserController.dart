import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../Modal/User.dart';

class UserController extends GetxController {

  final dio = Dio();
  RxList<User> users= RxList([]);
  RxBool isLoading = RxBool(false);
  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }


  void fetchUser() async {
    isLoading.value = true;
    dio.get('https://jsonplaceholder.typicode.com/users').then((value) {
      for(var element in value.data ?? []){
        User singleUser = User.fromJson(element);
        users.value.add(singleUser);
      }
      isLoading.value = false;
    }).catchError((err){

    });
  }

}