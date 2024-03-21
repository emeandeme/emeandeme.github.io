import 'package:emeandeme/module_structure/actions.dart';
import 'package:emeandeme/module_structure/launch_bean.dart';
import 'package:emeandeme/widgets/iframe.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      preferrizeHeight: 1200,
      child: Center(
          child: Column(
        children: [
          const Expanded(child: IframeScreen()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: ActionInk(
                onTap: () => LaunchBean(
                    uri: Uri.parse(
                        "https://docs.google.com/forms/d/e/1FAIpQLScUQE7onIpfGpl1hFmEtJcU4k2frkf0XjEVrDe07HXLJoAUcA/viewform?embedded=true")),
                child: const ColoredBox(
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Formulario'),
                  ),
                )),
          ),
        ],
      )

          // WebViewX(
          //   width: (MediaQuery.of(context).size.width * 0.77),
          //   height: widget.obtainTemplateSize(context),
          //   onWebViewCreated: (controller) => webviewController = controller,
          //   initialSourceType: SourceType.url,
          //   initialContent:
          //       "https://docs.google.com/forms/d/e/1FAIpQLScUQE7onIpfGpl1hFmEtJcU4k2frkf0XjEVrDe07HXLJoAUcA/viewform?embedded=true",
          // ),
          ),
    );
  }
}
