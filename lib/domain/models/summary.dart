import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable()
class Summary {
  final String summary;

  Summary({
    required this.summary,
  });

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
  factory Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);
}

