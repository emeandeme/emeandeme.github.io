import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class TimmingSection extends StatelessWidget {
  const TimmingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateSectionSliver(
      backgroundColor: Color(0xFFfffcf6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "TIMMING",
              style: TimmingTextStyle.title,
            )
          ],
        ),
      ),
    );
  }
}
