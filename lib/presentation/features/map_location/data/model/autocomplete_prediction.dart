class AutoCompletePrediction {
  final String? description;
  final String? placeId;
  final String? reference;
  final StructuredFormatting? structuredFormatting;

  AutoCompletePrediction({
    this.description,
    this.structuredFormatting,
    this.placeId,
    this.reference,
  });

  factory AutoCompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutoCompletePrediction(
        description: json['description'] as String?,
        placeId: json['place_id'] as String?,
        reference: json['reference'] as String?,
        structuredFormatting: json['structured_formatting'] != null
            ? StructuredFormatting.fromJson(json['structured_formatting'])
            : null);
  }
}

class StructuredFormatting {
  final String? mainText;
  final String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});
  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
        mainText: json['main_text'] as String?,
        secondaryText: json['secondart_text'] as String?);
  }
}
