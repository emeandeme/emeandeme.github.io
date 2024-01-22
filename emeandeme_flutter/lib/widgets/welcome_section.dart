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
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "BIENVENIDOS A NUESTRA BODA",
            style: WelcomeSectionTextStyle.title,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          Text(
            """Estamos muy felices de que estés leyendo esto, porque después de 9 años, significa que estás a un paso de acompañarnos en el día más importante de nuestra vida juntos.
            
            Durante estos meses vamos a informarte de todo lo que necesitas saber para llegar a nuestro gran día sin ninguna duda.
            
            Queremos verte disfrutar junto a nosotros y esperamos que bailes hasta que duelan los pies.""",
            style: WelcomeSectionTextStyle.descriptions,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          Text(
            "¿ESTAMOS LISTOS?",
            style: WelcomeSectionTextStyle.subTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    return TemplateSectionSliver(
      backgroundColor: const Color(0xFF929c89),
      child: Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        verticalDirection: VerticalDirection.up,
        children: [
          const PicturesWelcome(),
          welcomeDescription,
        ],
      ),
    );
  }
}

class PicturesWelcome extends StatelessWidget with MediaQueryLayaouts {
  const PicturesWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ColoredBox(
          color: const Color(0xFFfffcf6),
          child: Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _imageBuilder(),
            ),
          ),
        ),
      ),
    );
  }

  List<Padding> _imageBuilder() {
    return [
      Assets.images.slider1.image(),
      Assets.images.slider2.image(),
      Assets.images.slider3.image(),
    ]
        .map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: DecoratedBox(
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 10)]),
                  child: e),
            ))
        .toList();
  }
}
