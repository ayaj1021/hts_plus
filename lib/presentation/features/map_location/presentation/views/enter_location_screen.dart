import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/presentation/features/map_location/presentation/widgets/location_search_section.dart';
import 'package:hts_plus/presentation/features/map_location/presentation/widgets/map_screen_app_bar.dart';

class EnterLocationScreen extends StatefulWidget {
  const EnterLocationScreen({super.key});
  static const String routeName = '/enterLocation';

  @override
  State<EnterLocationScreen> createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            const MapScreenAppBar(),
            20.hSpace,
            const LocationSearchSection()
          ],
        ),
      )),
    );
  }
}