import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/presentation/features/map_location/data/get_location_result.dart';
import 'package:hts_plus/presentation/features/map_location/data/model/autocomplete_prediction.dart';
import 'package:hts_plus/presentation/features/map_location/data/model/place_auto_complete_response.dart';
import 'package:hts_plus/presentation/features/map_location/presentation/widgets/location_result_widget.dart';
import 'package:hts_plus/presentation/general_widgets/search_text_field.dart';

class LocationSearchSection extends StatefulWidget {
  const LocationSearchSection({super.key});

  @override
  State<LocationSearchSection> createState() => _LocationSearchSectionState();
}

class _LocationSearchSectionState extends State<LocationSearchSection> {
  final _locationSearchController = TextEditingController();

  List<AutoCompletePrediction> placePredictions = [];

  String key = "AIzaSyAt0pzVf7ndscehfOfe58biTcVgnEwYN2o";
  void placeAutoComplete(String query) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": query,
        "key": key,
      },
    );

    String? response = await GetLocationResult.fetchUrl(uri);

    if (response != null) {
      PlaceAutoCompleteResponse result =
          PlaceAutoCompleteResponse.parseAutoCompleteResult(response);

      if (result.prediction != null) {
        setState(() {
          placePredictions = result.prediction!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextField(
          onChanged: (value) {
            placeAutoComplete(value);
          },
          hintText: 'Enter Location',
          controller: _locationSearchController,
        ),
        20.hSpace,
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (context, index) {
                return LocationResultWidget(
                  press: () {},
                  location: '${placePredictions[index].description}',
                );
              }),
        )
      ],
    );
  }
}
