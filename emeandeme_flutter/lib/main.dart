import 'package:emeandeme/widgets/date_section.dart';
import 'package:emeandeme/widgets/form_section.dart';
import 'package:emeandeme/widgets/intro_section.dart';
import 'package:emeandeme/widgets/lodgings_section.dart';
import 'package:emeandeme/widgets/maps_sections.dart';
import 'package:emeandeme/widgets/timming_section.dart';
import 'package:emeandeme/widgets/welcome_section.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<GlobalKey> keys = List.generate(7, (index) => GlobalKey());
  List<double> jumps = [];

  @override
  void didChangeDependencies() {
    // ignore: unused_local_variable
    final mediaQueryDepence = MediaQuery.of(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final sizes = keys
          .map((e) =>
              (e.currentContext?.findRenderObject() as RenderBox).size.height)
          .toList();

      jumps = [
        sizes[0] + sizes[1],
        sizes[0] + sizes[1] + sizes[2],
        sizes[0] + sizes[1] + sizes[2] + sizes[3] + sizes[4],
        sizes[0] + sizes[1] + sizes[2] + sizes[3] + sizes[4] + sizes[5]
      ];

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
                key: keys[0],
                controller: controller,
                jumps: jumps,
              ),
            ),
            SliverToBoxAdapter(
              child: DateSection(
                key: keys[1],
                jumpToForm: () {
                  controller.jumpTo(
                    jumps[3],
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: WelcomeSection(
                key: keys[2],
              ),
            ),
            SliverToBoxAdapter(
              child: TimmingSection(
                key: keys[3],
              ),
            ),
            SliverToBoxAdapter(
              child: MapsSection(
                key: keys[4],
              ),
            ),
            SliverToBoxAdapter(
              child: LodgingsSection(
                key: keys[5],
              ),
            ),
            SliverToBoxAdapter(
              child: FormSection(
                key: keys[6],
              ),
            )
          ],
        ),
      ),
    );
  }
}
