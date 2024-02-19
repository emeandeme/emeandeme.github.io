import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

import 'package:webviewx/webviewx.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Center(
          child: WebViewX(
            width: (MediaQuery.of(context).size.width * 0.77),
            height: widget.obtainTemplateSize(context),
            onWebViewCreated: (controller) => webviewController = controller,
            initialSourceType: SourceType.url,
            initialContent:
                "https://docs.google.com/forms/d/e/1FAIpQLScUQE7onIpfGpl1hFmEtJcU4k2frkf0XjEVrDe07HXLJoAUcA/viewform?embedded=true",
          ),
        ),
      ),
    );
  }
}
