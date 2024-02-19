import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class TimmingSection extends StatefulWidget with MediaQueryLayaouts {
  const TimmingSection({super.key});

  @override
  State<TimmingSection> createState() => _TimmingSectionState();
}

class _TimmingSectionState extends State<TimmingSection> {
  final List<GlobalKey> keys = List.generate(5, (index) => GlobalKey());
  final GlobalKey currentKey = GlobalKey();
  double positionWidth = 0;
  List<Offset> circlesOffset = [];

  @override
  void didChangeDependencies() {
    // ignore: unused_local_variable
    final mediaQueryDepence = MediaQuery.of(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final currentOffset =
          (currentKey.currentContext?.findRenderObject() as RenderBox?)
              ?.localToGlobal(Offset.zero);
      circlesOffset = keys
          .map((e) => (getOffset(e, currentOffset) ?? Offset.zero))
          .toList();

      positionWidth = (circlesOffset.firstOrNull?.dx ?? 0).abs();
      setState(() {});
    });
    super.didChangeDependencies();
  }

  Offset? getOffset(GlobalKey key, Offset? currentOffset) {
    return (key.currentContext?.findRenderObject() as RenderBox?)
        ?.globalToLocal(currentOffset ?? Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateSectionSliver(
      key: currentKey,
      preferrizeHeight: 800 + 276 + 225,
      backgroundColor: const Color(0xFFfffcf6),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "TIMMING",
                style: TimmingTextStyle.title,
              ),
              TimmingLayer(
                circleKey: keys[0],
                timmingDefinition: TimmingDefinition(
                  time: "12.30",
                  event: "LA LLEGADA ",
                  description:
                      "Manu estará esperándote en la entrada de nuestra ceremonia, así que toma asiento que esto empieza!",
                  positionTimmingBox: PositionTimmingBox.right,
                ),
              ),
              TimmingLayer(
                circleKey: keys[1],
                timmingDefinition: TimmingDefinition(
                  time: "13:00",
                  event: "LA CEREMONIA",
                  description:
                      "Será bonita, emotiva y nada nos  hará más ilusión de que tú estés allí, ¡No tenemos un plan mejor!",
                  positionTimmingBox: PositionTimmingBox.left,
                ),
              ),
              TimmingLayer(
                circleKey: keys[2],
                timmingDefinition: TimmingDefinition(
                  time: "14:00",
                  event: "EL CÓCTEL",
                  description: "Momento de fuera nervios y disfrutar",
                  positionTimmingBox: PositionTimmingBox.right,
                ),
              ),
              TimmingLayer(
                circleKey: keys[3],
                timmingDefinition: TimmingDefinition(
                  time: "15.30",
                  event: "LA COMIDA",
                  description:
                      "Aún queda lo mejor así que deja descansar un poquito los pies y prepárate para el broche final",
                  positionTimmingBox: PositionTimmingBox.left,
                ),
              ),
              TimmingLayer(
                circleKey: keys[4],
                timmingDefinition: TimmingDefinition(
                  time: "18.00",
                  event: "BARRA LIBRE",
                  description: "¡A por todas!",
                  positionTimmingBox: PositionTimmingBox.right,
                ),
              ),
            ],
          ),
          if (circlesOffset.isNotEmpty) ...[
            _generateLines(
                startOffset: circlesOffset[0], endOffset: circlesOffset[1]),
            _generateLines(
                startOffset: circlesOffset[1], endOffset: circlesOffset[2]),
            _generateLines(
                startOffset: circlesOffset[2], endOffset: circlesOffset[3]),
            _generateLines(
                startOffset: circlesOffset[3], endOffset: circlesOffset[4]),
          ]
        ],
      ),
    );
  }

  Widget _generateLines(
      {required Offset startOffset, required Offset endOffset}) {
    return Positioned(
      left: positionWidth + 7,
      top: (startOffset.dy).abs() + 32,
      height: (((endOffset.dy).abs() - 18) - (startOffset.dy).abs()) - 26,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFF929c89),
        ),
        child: FittedBox(child: SizedBox(width: 3, height: 113)),
      ),
    );
  }
}

enum PositionTimmingBox {
  left,
  right;

  T resolve<T>({required T onLeft, required T onRight}) {
    return switch (this) {
      PositionTimmingBox.left => onLeft,
      PositionTimmingBox.right => onRight,
    };
  }
}

final class TimmingDefinition {
  TimmingDefinition({
    required this.time,
    required this.event,
    required this.description,
    required this.positionTimmingBox,
  });
  final String time;
  final String event;
  final String description;
  final PositionTimmingBox positionTimmingBox;
}

class TimmingLayer extends StatelessWidget with MediaQueryLayaouts {
  const TimmingLayer({
    super.key,
    required this.timmingDefinition,
    required this.circleKey,
  });

  final TimmingDefinition timmingDefinition;
  final GlobalKey? circleKey;

  @override
  Widget build(BuildContext context) {
    final width = (screenWidth(context) * 0.17).clamp(125, 270).toDouble();
    final circle = DecoratedBox(
      key: circleKey,
      decoration: const BoxDecoration(
        color: Color(0xFF929c89),
        shape: BoxShape.circle,
      ),
      child: const SizedBox.square(dimension: 18),
    );
    final box = DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
      )),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: isSmallScreen(context) ? 16 : 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timmingDefinition.time,
                style: TimmingTextStyle.time,
              ),
              const SizedBox(height: 4),
              Text(
                timmingDefinition.event,
                style: TimmingTextStyle.descriptionTitle,
              ),
              const SizedBox(height: 8),
              Text(
                timmingDefinition.description,
                style: TimmingTextStyle.description,
              ),
            ],
          ),
        ),
      ),
    );
    final text = SizedBox(
      width: width,
      child: Align(
        alignment: timmingDefinition.positionTimmingBox.resolve<Alignment>(
            onLeft: Alignment.centerLeft, onRight: Alignment.centerRight),
        child: const Text(
          "PARQUE DE LA MARQUESA",
          style: TimmingTextStyle.place,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          timmingDefinition.positionTimmingBox
              .resolve<Widget>(onLeft: box, onRight: text),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: circle),
          timmingDefinition.positionTimmingBox
              .resolve<Widget>(onLeft: text, onRight: box),
          const Spacer(),
        ],
      ),
    );
  }
}
