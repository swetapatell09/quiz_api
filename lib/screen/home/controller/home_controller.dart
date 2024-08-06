import 'dart:async';

import 'package:get/get.dart';
import 'package:quiz_api/screen/home/model/home_model.dart';
import 'package:quiz_api/utils/api_helper.dart';

class HomeController extends GetxController {
  Rxn<HomeModel> model = Rxn();
  RxList<QuizModel> quizList = <QuizModel>[].obs;
  RxInt index = 0.obs;
  RxInt totalResult = 0.obs;
  RxInt second = 20.obs;

  Timer? time;

  Future<void> quizApi() async {
    HomeModel? h1 = await APIHelper.helper.getData();
    model.value = h1;
    randomData();
  }

  void randomData() {
    if (model.value != null) {
      List<QuizModel> result = [];
      for (ResultsModel r1 in model.value!.resultsModel!) {
        List allOption = r1.incorrect_answers!;
        allOption.add(r1.correct_answer);
        allOption.shuffle();
        QuizModel q1 = QuizModel(
          question: r1.question,
          correct_answer: r1.correct_answer,
          option: allOption,
        );
        result.add(q1);
      }
      quizList.value = result;
    }
  }

  void getResult(String answer) {
    if (answer == quizList[index.value].correct_answer) {
      totalResult.value++;
    }
  }

  void setTimer() {
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second > 0 && index.value != quizList.length) {
        second.value--;
        print("*-*-*-*- $second *-*-*-*");
      } else {
        if (index.value != quizList.length - 1) {
          index.value++;
        } else {
          timer.cancel();
          Get.offAllNamed('result');
        }
        second.value = 20;
      }
    });
  }
}
