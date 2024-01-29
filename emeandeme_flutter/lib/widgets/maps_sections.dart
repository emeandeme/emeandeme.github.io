import 'package:emeandeme/gen/assets.gen.dart';
import 'package:emeandeme/module_structure/actions.dart';
import 'package:emeandeme/module_structure/launch_bean.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class MapsSection extends StatelessWidget {
  const MapsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateSectionSliver(
      preferrizeHeight: 700,
      child: GoogleMapsIframe(),
    );
  }
}

class GoogleMapsIframe extends StatelessWidget {
  const GoogleMapsIframe({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 50),
      child: ActionInk(
        onTap: LaunchBean.fromString(
                "https://www.google.com/maps/place/Parque+de+la+Marquesa/@38.1257748,-1.2947003,17z/data=!3m1!4b1!4m6!3m5!1s0xd647a81d39c0fad:0x1462a6614c061884!8m2!3d38.1257748!4d-1.2947003!16s%2Fg%2F12qg04vjx?entry=ttu")
            .launch,
        child: DecoratedBox(
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 30, color: Colors.black12)]),
          child: Assets.images.mapaMarquesa.image(
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  //http://maps.google.com/maps?q=38.12593513016026, -1.2946573874693699&z=18&output=embed
}
