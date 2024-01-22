import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/gen/assets.gen.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class LodgingsSection extends StatelessWidget {
  const LodgingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateSectionSliver(
      backgroundColor: const Color(0xFF929c89),
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32),
              child: Text(
                "RECOMENDACIONES DE ALOJAMIENTOS",
                style: LodgingsTextStyle.title,
              ),
            ),
            const SizedBox(height: 34),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                HouseLodgingsInfo(
                  image: Assets.images.slider1.provider(),
                  title: "APARTAHOTEL ARCHYVAL",
                  description: "www.apartamentosarchyval.com",
                  textNumber: "968 67 48 22",
                  direcction: "Calle Venezuela,1,30600, Archena, Murcia ",
                ),
                HouseLodgingsInfo(
                  image: Assets.images.slider1.provider(),
                  title: "HOTEL HYLTOR",
                  description: "www.hotelhyltor.com",
                  textNumber: "968 68 82 05",
                  direcction:
                      "Carr. del Balneario, 12-14, 30600 Archena, Murcia",
                ),
              ],
            ),
            const Spacer(),
            const Padding(
              padding:
                  EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "*",
                    style: LodgingsTextStyle.descriptions,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "DESCUENTO EN AMBOS ALOJAMIENTOS (BODA MANU Y MARÍA LUISA) - PARQUE DE LA MARQUESA",
                        style: LodgingsTextStyle.descriptions,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class HouseLodgingsInfo extends StatelessWidget {
  const HouseLodgingsInfo(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.textNumber,
      required this.direcction});

  final ImageProvider image;
  final String title;
  final String description;
  final String textNumber;
  final String direcction;

  @override
  Widget build(BuildContext context) {
    const extraSmallSeparator = SizedBox(height: 8);
    const smallSeparator = SizedBox(height: 24);
    const separator = SizedBox(height: 24);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
              ),
              shape: BoxShape.circle,
            ),
            child: const SizedBox.square(dimension: 250),
          ),
          extraSmallSeparator,
          Text(
            title,
            style: LodgingsTextStyle.name,
          ),
          extraSmallSeparator,
          const Text(
            "*",
            style: LodgingsTextStyle.name,
          ),
          extraSmallSeparator,
          Text(
            description,
            style: LodgingsTextStyle.descriptions,
          ),
          smallSeparator,
          Text(
            textNumber,
            style: LodgingsTextStyle.descriptions,
          ),
          separator,
          Text(
            direcction,
            style: LodgingsTextStyle.descriptions,
          ),
        ],
      ),
    );
  }
}
