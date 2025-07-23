import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_post_controller.dart';

class MyPostView extends GetView<MyPostController> {
  const MyPostView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPostView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyPostView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
