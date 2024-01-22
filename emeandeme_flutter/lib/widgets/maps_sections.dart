import 'dart:html';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';
import 'dart:ui_web' as ui;

class MapsSection extends StatelessWidget {
  const MapsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateSectionSliver(
      child: GoogleMapsIframe(),
    );
  }
}

class GMapsHtml extends StatefulWidget {
  final String url;
  const GMapsHtml({super.key, required this.url});
  @override
  _GMapsHtmlState createState() => _GMapsHtmlState();
}

class _GMapsHtmlState extends State<GMapsHtml> {
  late Widget iframeWidget;
  final IFrameElement iframeElement = IFrameElement();
  @override
  void initState() {
    super.initState();
    iframeElement.height = '100%';
    iframeElement.width = '100%';
    iframeElement.src = widget.url;
    iframeElement.style.border = 'none';

    ui.platformViewRegistry.registerViewFactory(
      widget.url,
      (int viewId) => iframeElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: widget.url,
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
      child: const GMapsHtml(
        url:
            "http://maps.google.com/maps?q=38.12593513016026, -1.2946573874693699&z=18&output=embed",
      ),
    );
  }
}
