import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/gen/assets.gen.dart';
import 'package:emeandeme/module_structure/actions.dart';
import 'package:emeandeme/module_structure/launch_bean.dart';
import 'package:emeandeme/module_structure/phone_call_bean.dart';
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
                  directionUrl:
                      "https://www.google.es/maps/place/Apartamentos+turisticos+Archybal/@38.1200698,-1.3004258,17z/data=!3m2!4b1!5s0xd647a180d6ccf9b:0x8657b464fb4ed24!4m9!3m8!1s0xd647a1881b885f5:0xe66b79c746131612!5m2!4m1!1i2!8m2!3d38.1200698!4d-1.2978509!16s%2Fg%2F1wc499g9?entry=ttu",
                ),
                HouseLodgingsInfo(
                  image: Assets.images.slider1.provider(),
                  title: "HOTEL HYLTOR",
                  description: "www.hotelhyltor.com",
                  textNumber: "968 68 82 05",
                  direcction:
                      "Carr. del Balneario, 12-14, 30600 Archena, Murcia",
                  directionUrl:
                      "https://www.google.es/maps/place/Hotel+Hyltor/@38.1189508,-1.3009057,17z/data=!3m1!4b1!4m9!3m8!1s0xd647a22adf11ead:0xcb8e31f19cf90e6d!5m2!4m1!1i2!8m2!3d38.1189508!4d-1.2983308!16s%2Fg%2F1tfmpr0b?entry=ttu",
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
  const HouseLodgingsInfo({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.textNumber,
    required this.direcction,
    required this.directionUrl,
  });

  final ImageProvider image;
  final String title;
  final String description;
  final String textNumber;
  final String direcction;
  final String directionUrl;

  @override
  Widget build(BuildContext context) {
    const extraSmallSeparator = SizedBox(height: 8);
    const smallSeparator = SizedBox(height: 24);
    const separator = SizedBox(height: 24);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: ActionInk(
        onTap: LaunchBean.fromString("https://$description").launch,
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
            SelectableText(
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
            ActionInk(
              onTap: PhoneCallBean(number: textNumber).call,
              child: Text(
                textNumber,
                style: LodgingsTextStyle.descriptions,
              ),
            ),
            separator,
            ActionInk(
              onTap: LaunchBean.fromString(directionUrl).launch,
              child: Text(
                direcction,
                style: LodgingsTextStyle.descriptions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
