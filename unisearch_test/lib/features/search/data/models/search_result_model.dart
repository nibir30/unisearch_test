import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/search_result_entity.dart';

part 'search_result_model.g.dart';

@JsonSerializable()
class SearchResultModel {
  String? state_province;
  List<String>? web_pages;
  String? country;
  String? name;
  String? alpha_two_code;
  List<String>? domains;

  SearchResultModel(
    this.state_province,
    this.web_pages,
    this.country,
    this.name,
    this.alpha_two_code,
    this.domains,
  );

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => _$SearchResultModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);

  SearchResultEntity toEntity() => SearchResultEntity(
        state_province,
        web_pages,
        country,
        name,
        alpha_two_code,
        domains,
      );
}
