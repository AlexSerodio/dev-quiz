import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedQuestionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: widget.question.answers[i],
              isSelected: selectedQuestionIndex == i,
              disabled: selectedQuestionIndex > -1,
              onTap: () {
                selectedQuestionIndex = i;

                setState(() {});
                Future.delayed(Duration(milliseconds: 500))
                    .then((value) => widget.onChange());
              },
            ),
        ],
      ),
    );
  }
}
