import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/user_detail_controller.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailController controller = Get.put(UserDetailController());

    final Map<String, dynamic> user = Get.arguments;

    controller.setUser(user);

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.user.value['name'] ?? 'User Detail')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final user = controller.user.value;
          if (user.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: [
              Text(
                'Name: ${user['name']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Username: ${user['username']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Email: ${user['email']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Phone: ${user['phone']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Website: ${user['website']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Address:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${user['address']['street']}, ${user['address']['suite']}, '
                '${user['address']['city']}, ${user['address']['zipcode']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Company:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                user['company']['name'],
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                user['company']['catchPhrase'],
                style:
                    const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ],
          );
        }),
      ),
    );
  }
}
