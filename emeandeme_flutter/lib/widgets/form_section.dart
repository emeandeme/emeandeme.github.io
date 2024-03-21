import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/module_structure/actions.dart';
import 'package:emeandeme/module_structure/launch_bean.dart';
import 'package:emeandeme/widgets/iframe.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

import 'package:webviewx_plus/webviewx_plus.dart';

class FormSection extends StatefulWidget with MediaQueryLayaouts {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  late WebViewXController webviewController;

  @override
  Widget build(BuildContext context) {
    return TemplateSectionSliver(
      preferrizeHeight: MediaQuery.of(context).size.height,
      child: Center(
          child: Column(
        children: [
          const Expanded(child: RepaintBoundary(child: IframeScreen())),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ActionInk(
                onTap: LaunchBean(
                    uri: Uri.parse(
                  "https://docs.google.com/forms/d/e/1FAIpQLScUQE7onIpfGpl1hFmEtJcU4k2frkf0XjEVrDe07HXLJoAUcA/viewform?embedded=true",
                )).launch,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFF929c89).withOpacity(0.7),
                    borderRadius: const BorderRadius.all(
                      Radius.elliptical(35, 20),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: Text(
                      "Abrir en Google Forms".toUpperCase(),
                      style: TextStyles.dateButton,
                    ),
                  ),
                ),
              )),
        ],
      )),
    );
  }
}
