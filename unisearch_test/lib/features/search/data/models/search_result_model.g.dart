// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) {
  return SearchResultModel(
    json['state-province'] as String?,
    (json['web_pages'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['country'] as String?,
    json['name'] as String?,
    json['alpha_two_code'] as String?,
    (json['domains'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) => <String, dynamic>{
      'state-province': instance.state_province,
      'web_pages': instance.web_pages,
      'country': instance.country,
      'name': instance.name,
      'alpha_two_code': instance.alpha_two_code,
      'domains': instance.domains,
    };
