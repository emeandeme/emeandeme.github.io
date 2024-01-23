import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/gen/assets.gen.dart';
import 'package:emeandeme/module_structure/actions.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class IntroSection extends StatelessWidget with MediaQueryLayaouts {
  const IntroSection({super.key, required this.controller});
  final ScrollController controller;

  static const double jumpWelcome = 700 * 2;
  @override
  Widget build(BuildContext context) {
    final genericSize = obtainTemplateSize(context);
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
                  action: () {
                    controller.animateTo(jumpWelcome,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.decelerate);
                  },
                ),
                IntroActions(
                  title: "La Boda",
                  action: () {
                    controller.jumpTo(
                      (jumpWelcome + genericSize),
                    );
                  },
                ),
                IntroActions(
                  title: "Alojamiento",
                  action: () {
                    controller.jumpTo((jumpWelcome + genericSize * 3));
                  },
                ),
                IntroActions(
                  title: "Confirma tu asistencia",
                  action: () {
                    controller.jumpTo((jumpWelcome + genericSize * 4));
                  },
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
    return ActionInk(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          title.toUpperCase(),
          style: TextStyles.headerStyle,
        ),
      ),
    );
  }
}
