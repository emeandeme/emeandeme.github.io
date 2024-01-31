import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FormSection extends StatelessWidget with MediaQueryLayaouts {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateSectionSliver(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen(context)
                ? 64
                : (MediaQuery.of(context).size.width * 0.23),
            vertical: 64),
        child: InAppWebView(
          initialUrlRequest: URLRequest(
              url: WebUri(
                  "https://docs.google.com/forms/d/e/1FAIpQLScUQE7onIpfGpl1hFmEtJcU4k2frkf0XjEVrDe07HXLJoAUcA/viewform?embedded=true")),
        ),
      ),
    );
  }
}
