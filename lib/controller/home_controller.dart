import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  RxList<dynamic> users = <dynamic>[].obs;
  RxList<dynamic> filteredUsers = <dynamic>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;
  RxString searchQuery = ''.obs;

  // Fetch data from API
  Future<void> fetchUsers() async {
    isLoading(true);
    error('');
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        users.value = json.decode(response.body);
        filteredUsers.value = users;
      } else {
        error('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      error('An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  // Filter users based on the search query
  void filterUsers(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredUsers.value = users;
    } else {
      filteredUsers.value = users.where((user) {
        return user['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }
}
