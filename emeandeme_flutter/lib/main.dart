import 'package:emeandeme/widgets/date_section.dart';
import 'package:emeandeme/widgets/intro_section.dart';
import 'package:emeandeme/widgets/lodgings_section.dart';
import 'package:emeandeme/widgets/maps_sections.dart';
import 'package:emeandeme/widgets/timming_section.dart';
import 'package:emeandeme/widgets/welcome_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmeAndEme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return Material(
      type: MaterialType.transparency,
      child: ColoredBox(
        color: Colors.white,
        child: CustomScrollView(
          controller: controller,
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: IntroSection(
                controller: controller,
              ),
            ),
            const SliverToBoxAdapter(
              child: DateSection(),
            ),
            const SliverToBoxAdapter(
              child: WelcomeSection(),
            ),
            const SliverToBoxAdapter(
              child: TimmingSection(),
            ),
            const SliverToBoxAdapter(
              child: MapsSection(),
            ),
            const SliverToBoxAdapter(
              child: LodgingsSection(),
            ),
          ],
        ),
      ),
    );
  }
}
