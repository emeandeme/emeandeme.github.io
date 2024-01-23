import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class TimmingSection extends StatelessWidget with MediaQueryLayaouts {
  const TimmingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateSectionSliver(
      preferrizeHeight: 800 + 276,
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
              _generateRow(
                context,
                TimmingDefinition(
                  time: "12.00",
                  event: "LA LLEGADA ",
                  description:
                      "Manu estará esperándote en la entrada de nuestra ceremonia, así que toma asiento que esto empieza!",
                  positionTimmingBox: PositionTimmingBox.right,
                ),
              ),
              _generateRow(
                context,
                TimmingDefinition(
                  time: "12.30",
                  event: "LA CEREMONIA",
                  description:
                      "Será bonita, emotiva y nada nos  hará más ilusión de que tú estés allí, ¡No tenemos un plan mejor!",
                  positionTimmingBox: PositionTimmingBox.left,
                ),
              ),
              _generateRow(
                context,
                TimmingDefinition(
                  time: "13.30",
                  event: "EL CÓCTEL",
                  description:
                      "Momento de fuera nervios y disfrutar",
                  positionTimmingBox: PositionTimmingBox.right,
                ),
              ),
              _generateRow(
                context,
                TimmingDefinition(
                  time: "15.00",
                  event: "LA COMIDA",
                  description:
                      "Aún queda lo mejor así que deja descansar un poquito los pies y prepárate para el broche final",
                  positionTimmingBox: PositionTimmingBox.left,
                ),
              ),
              _generateRow(
                context,
                TimmingDefinition(
                  time: "18.00",
                  event: "BARRA LIBRE",
                  description:
                      "¡A por todas!",
                  positionTimmingBox: PositionTimmingBox.right,
                ),
              ),
            ],
          ),
          Center(
            child: _generateLines(),
          )
        ],
      ),
    );
  }

  Widget _generateLines() {
    const circle = DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFF929c89),
        shape: BoxShape.circle,
      ),
      child: SizedBox.square(dimension: 18),
    );
    const line = DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFF929c89),
      ),
      child: SizedBox(width: 3, height: 119),
    );
    return const Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 148),
        circle,
        SizedBox(height: 18),
        line,
        SizedBox(height: 18),
        circle,
        SizedBox(height: 18),
        line,
        SizedBox(height: 18),
        circle,
        SizedBox(height: 18),
        line,
        SizedBox(height: 18),
        circle,
        SizedBox(height: 18),
        line,
        SizedBox(height: 18),
        circle,
      ],
    );
  }

  Widget _generateRow(
      BuildContext context, TimmingDefinition timmingDefinition) {
    final width = (screenWidth(context) * 0.17).clamp(150, 270).toDouble();
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
          const SizedBox(width: 86),
          timmingDefinition.positionTimmingBox
              .resolve<Widget>(onLeft: text, onRight: box),
          const Spacer(),
        ],
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
