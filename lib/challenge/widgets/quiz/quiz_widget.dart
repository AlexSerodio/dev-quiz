import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title: "Possibilita a criação de aplicativos compilados nativamente",
            isRight: true,
            isSelected: true,
          ),
          AnswerWidget(
            title: "Possibilita a criação de aplicativos compilados nativamente",
            isRight: false,
            isSelected: true,
          ),
          AnswerWidget(
            title: "Possibilita a criação de aplicativos compilados nativamente"
          ),
          AnswerWidget(
            title: "Possibilita a criação de aplicativos compilados nativamente"
          ),
        ],
      ),
    );
  }
}
