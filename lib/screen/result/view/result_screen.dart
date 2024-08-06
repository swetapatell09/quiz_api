import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api/screen/home/controller/home_controller.dart';
import 'package:quiz_api/utils/text_style.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.deepOrange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text('Congrats!', style: txtCongrats),
                const Spacer(),
                Text('YOUR SCORE', style: txtScore),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        '${controller.totalResult.value}/${controller.quizList.length}',
                        style: txtResult),
                    Text('🪙 +90 points', style: txt26)
                  ],
                ),
                controller.totalResult.value == controller.quizList.length
                    ? Image.asset('assets/image/win1.png', height: 200)
                    : Image.asset('assets/image/lose.png', height: 200),
                const Spacer(),
                SizedBox(
                  width: 180,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.totalResult.value = 0;
                      controller.index.value = 0;
                      controller.second.value = 20;
                      controller.quizList.value = [];
                      Get.offAllNamed('home');
                    },
                    child: Text('Play again', style: txtReplay),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
