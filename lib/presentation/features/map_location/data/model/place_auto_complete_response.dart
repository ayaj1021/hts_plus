import 'dart:convert';

import 'package:hts_plus/presentation/features/map_location/data/model/autocomplete_prediction.dart';

class PlaceAutoCompleteResponse {
  final String? status;
  final List<AutoCompletePrediction>? prediction;
PlaceAutoCompleteResponse({this.status, this.prediction});

 factory PlaceAutoCompleteResponse.fromJson(Map<String, dynamic> json){
  return PlaceAutoCompleteResponse(
    status: json['status'] as String?,
    prediction: json['predictions'] !=  null ? json['predictions'].map<AutoCompletePrediction>(
      (json) =>  AutoCompletePrediction.fromJson(json),
    ).toList() : null
  );

 }

 static PlaceAutoCompleteResponse parseAutoCompleteResult(String responseBody){
  final parsed = json.decode(responseBody).cast<String, dynamic>();

  return PlaceAutoCompleteResponse.fromJson(parsed);
 }
}