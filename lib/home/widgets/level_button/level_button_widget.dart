import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dev_quiz/shared/enums/level_enum.dart';

class LevelButtonWidget extends StatelessWidget {
  final Level level;

  LevelButtonWidget({Key? key, required this.level}) : super(key: key);

  final config = {
    Level.facil: {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },
    Level.medio: {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },
    Level.dificil: {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },
    Level.perito: {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    },
  };

  Color get color => config[level]!['color']!;
  Color get borderColor => config[level]!['borderColor']!;
  Color get fontColor => config[level]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
            BorderSide(color: borderColor)),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(level.label,
            style: GoogleFonts.notoSans(
              color: fontColor,
              fontSize: 13,
            )),
      ),
    );
  }
}
