import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/gen/assets.gen.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget with MediaQueryLayaouts {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeDescription = SizedBox(
      width: !isSmallScreen(context) ? 550 : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "BIENVENIDOS A NUESTRA BODA",
            style: WelcomeSectionTextStyle.title,
            textAlign: TextAlign.center,
          ),
          if (isSmallScreen(context)) const PicturesWelcome(),
          const SizedBox(height: 32),
          const Text(
            """Estamos muy felices de que estés leyendo esto, porque después de 9 años, significa que estás a un paso de acompañarnos en el día más importante de nuestra vida juntos.
            
            Durante estos meses vamos a informarte de todo lo que necesitas saber para llegar a nuestro gran día sin ninguna duda.
            
            Queremos verte disfrutar junto a nosotros y esperamos que bailes hasta que duelan los pies.""",
            style: WelcomeSectionTextStyle.descriptions,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const Text(
            "¿ESTAMOS LISTOS?",
            style: WelcomeSectionTextStyle.subTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    return TemplateSectionSliver(
      preferrizeHeight: 800,
      backgroundColor: const Color(0xFF929c89),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            if (!isSmallScreen(context)) const PicturesWelcome(),
            welcomeDescription,
          ],
        ),
      ),
    );
  }
}

class PicturesWelcome extends StatelessWidget with MediaQueryLayaouts {
  const PicturesWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSmallScreen(context) ? null : 225,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ColoredBox(
          color: const Color(0xFFfffcf6),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            direction: isSmallScreen(context) ? Axis.horizontal : Axis.vertical,
            children: _imageBuilder(context),
          ),
        ),
      ),
    );
  }

  List<Padding> _imageBuilder(BuildContext context) {
    final double imageWidh = isSmallScreen(context) ? 100 : 130;
    return [
      if (!isSmallScreen(context))
        Assets.images.slider1.image(width: imageWidh),
      Assets.images.slider2.image(width: imageWidh),
      Assets.images.slider3.image(width: imageWidh),
    ]
        .map((e) => Padding(
              padding: const EdgeInsets.only(
                  bottom: 12, top: 12, left: 12, right: 12),
              child: DecoratedBox(
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 10)]),
                  child: e),
            ))
        .toList();
  }
}
