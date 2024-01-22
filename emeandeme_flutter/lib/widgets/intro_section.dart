import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/gen/assets.gen.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class IntroSection extends StatelessWidget with MediaQueryLayaouts {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        TemplateSectionSliver(
          preferrizeHeight: 700,
          image: Assets.images.introImage.provider(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "¡QUE SÍ, QUE NOS CASAMOS!",
                  style: TextStyles.headerTitleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Assets.images.logo.logoLight
                      .image(fit: BoxFit.fitWidth, width: 300),
                ),
              ],
            ),
          ),
        ),
        if (!isSmallScreen(context))
          DecoratedBox(
            decoration:
                BoxDecoration(color: const Color(0xFF929c89).withOpacity(0.9)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IntroActions(
                  title: "Inicio",
                  action: () {},
                ),
                IntroActions(
                  title: "Bienvenidos",
                  action: () {},
                ),
                IntroActions(
                  title: "La Boda",
                  action: () {},
                ),
                IntroActions(
                  title: "Alojamiento",
                  action: () {},
                ),
                IntroActions(
                  title: "Confirma tu asistencia",
                  action: () {},
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class IntroActions extends StatelessWidget {
  const IntroActions({super.key, required this.title, required this.action});

  final String title;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        title.toUpperCase(),
        style: TextStyles.headerStyle,
      ),
    );
  }
}
