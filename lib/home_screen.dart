import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_profile/search_widget.dart';
import 'controller/home_controller.dart';
import 'user_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: UserSearchDelegate(controller),
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.error.value,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: controller.fetchUsers,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.fetchUsers,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
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
                  Get.to(() => const UserDetailScreen(), arguments: user);
                },
              );
            },
          ),
        );
      }),
    );
  }
}
