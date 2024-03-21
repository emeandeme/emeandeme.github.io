import 'package:emeandeme/constants/text_styles.dart';
import 'package:emeandeme/module_structure/actions.dart';
import 'package:emeandeme/widgets/sections/template_section.dart';
import 'package:flutter/material.dart';

class DateSection extends StatelessWidget {
  const DateSection({super.key, required this.jumpToForm});
  final VoidCallback jumpToForm;
  static const size = 700;

  @override
  Widget build(BuildContext context) {
    const separtor = SizedBox(height: 32);
    return TemplateSectionSliver(
      preferrizeHeight: 700,
      backgroundColor: const Color(0xFFfffcf6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "¿CUANDO & DÓNDE?",
                style: TextStyles.dateTitles,
                textAlign: TextAlign.center,
              ),
              separtor,
              const FittedBox(
                child: Text(
                  "26/10/24",
                  style: TextStyles.date,
                  textAlign: TextAlign.center,
                ),
              ),
              separtor,
              const SelectionArea(
                child: Text(
                  "PARQUE DE LA MARQUESA · 12.30 H",
                  style: TextStyles.dateTitles,
                  textAlign: TextAlign.center,
                ),
              ),
              separtor,
              ActionInk(
                onTap: () {
                  jumpToForm.call();
                },
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
                      "CONFIRMA TU ASISTENCIA".toUpperCase(),
                      style: TextStyles.dateButton,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
