import 'package:flutter/material.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/shared/enums/level_enum.dart';
import 'package:dev_quiz/challenge/challenge_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.loading ||
        controller.state == HomeState.empty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(
        user: controller.user!,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    level: Level.easy,
                  ),
                  LevelButtonWidget(
                    level: Level.medium,
                  ),
                  LevelButtonWidget(
                    level: Level.hard,
                  ),
                  LevelButtonWidget(
                    level: Level.expert,
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            answeredQuestionsAmount: e.questionsAnswered,
                            totalQuestionsAmount: e.questions.length,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                            questions: e.questions,
                                            title: e.title,
                                          )));
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          )),
    );
  }
}
