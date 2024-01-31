import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/gen/assets.gen.dart';
import 'package:emeandeme/module_structure/actions.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class IntroSection extends StatelessWidget with MediaQueryLayaouts {
  const IntroSection({
    super.key,
    required this.controller,
    required this.jumps,
  });
  final ScrollController controller;

  final List<double> jumps;

  @override
  Widget build(BuildContext context) {
    final isSmall = isSmallScreen(context);

    if (isSmall) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TemplateSectionSliver(
            backgroundColor: const Color(0xFF929c89),
            preferrizeHeight: 250,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
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
          ),
          Stack(
            fit: StackFit.loose,
            children: [
              TemplateSectionSliver(
                preferrizeHeight: 700,
                image: Assets.images.introImage.provider(),
              ),
              ColoredBox(
                color: const Color(0xFF929c89).withOpacity(0.4),
                child: const SizedBox(
                  height: 700,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ],
      );
    }

    return Stack(
      children: [
        TemplateSectionSliver(
          preferrizeHeight: 700,
          image: Assets.images.introBig.provider(),
        ),
        ColoredBox(
          color: Colors.black.withOpacity(0.4),
          child: const SizedBox(
            height: 700,
            width: double.infinity,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
        if (!isSmall)
          DecoratedBox(
            decoration:
                BoxDecoration(color: const Color(0xFF929c89).withOpacity(0.9)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IntroActions(
                  title: "Inicio",
                  action: () {
                    controller.jumpTo(
                      0,
                    );
                  },
                ),
                IntroActions(
                  title: "Bienvenidos",
                  action: () {
                    controller.animateTo(jumps[0],
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.decelerate);
                  },
                ),
                IntroActions(
                  title: "La Boda",
                  action: () {
                    controller.jumpTo(
                      jumps[1],
                    );
                  },
                ),
                IntroActions(
                  title: "Alojamiento",
                  action: () {
                    controller.jumpTo(
                      jumps[2],
                    );
                  },
                ),
                IntroActions(
                  title: "Confirma tu asistencia",
                  action: () {
                    controller.jumpTo(
                      jumps[3],
                    );
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
