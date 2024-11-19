import 'package:get/get.dart';

class UserDetailController extends GetxController {
  Rx<Map<String, dynamic>> user = Rx<Map<String, dynamic>>({});

  void setUser(Map<String, dynamic> userData) {
    user.value = userData;
  }
}
