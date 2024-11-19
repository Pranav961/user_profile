import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_profile/user_detail_screen.dart';
import 'controller/home_controller.dart';

class UserSearchDelegate extends SearchDelegate {
  final HomeController controller;

  UserSearchDelegate(this.controller);

  @override
  String? get searchFieldLabel => 'Search by name';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          controller.filterUsers(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.filterUsers(query);
    });
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.filterUsers(query);
    });
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return Obx(() {
      if (controller.filteredUsers.isEmpty) {
        return const Center(child: Text('No results found'));
      }

      return ListView.builder(
        itemCount: controller.filteredUsers.length,
        itemBuilder: (context, index) {
          final user = controller.filteredUsers[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Text(user['email']),
            leading: CircleAvatar(
              child: Text(user['name'][0].toUpperCase()),
            ),
            onTap: () {
              close(context, null);
              Get.to(() => const UserDetailScreen(), arguments: user);
            },
          );
        },
      );
    });
  }
}
