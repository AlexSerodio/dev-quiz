import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.white)),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 10,),
          Text(
            "Gerenciamento de Estado",
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "3 de 10", 
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 3,
                child: ProgressIndicatorWidget(value: .3,),
              ),
            ],
          )
        ],
      ),
    );
  }
}