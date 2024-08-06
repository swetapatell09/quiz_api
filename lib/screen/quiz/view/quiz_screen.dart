import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api/screen/home/controller/home_controller.dart';
import 'package:quiz_api/utils/text_style.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.setTimer();
  }

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
                  end: Alignment.bottomCenter)),
          child: Center(
            child: SingleChildScrollView(
              child: Obx(
                () => controller.quizList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.cancel_outlined,
                                      size: 35),
                                ),
                                Obx(
                                  () => Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text('${controller.second}',
                                          style: txt25),
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          value: controller.second / 20,
                                          valueColor:
                                              const AlwaysStoppedAnimation(
                                                  Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  '${controller.index.value + 1} Question :-',
                                  style: txt25),
                            ),
                            SelectableText(
                                '${controller.quizList[controller.index.value].question}',
                                style: txt28),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                options(
                                    '${controller.quizList[controller.index.value].option![0]}'),
                                options(
                                    '${controller.quizList[controller.index.value].option![1]}'),
                                options(
                                    '${controller.quizList[controller.index.value].option![2]}'),
                                options(
                                    '${controller.quizList[controller.index.value].option![3]}'),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell options(String text) {
    return InkWell(
      onTap: () {
        controller.getResult(text);
        if (controller.index.value != controller.quizList.length - 1) {
          controller.second.value = 20;
          controller.index.value++;
        } else {
          controller.time!.cancel();
          Get.offAllNamed('result');
        }
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Text(text, style: txt25),
      ),
    );
  }
}
