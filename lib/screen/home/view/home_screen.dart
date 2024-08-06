import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.quizApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => Get.toNamed('quiz'),
                child: Image.asset(
                  'assets/image/quiz4.png',
                  height: 300,
                  width: 300,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Get.toNamed('quiz');
                },
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
