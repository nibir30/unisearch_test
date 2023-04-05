// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_search_results_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSearchResultsModel _$GetSearchResultsModelFromJson(
    Map<String, dynamic> json) {
  return GetSearchResultsModel(
    (json['results'] as List<dynamic>?)
        ?.map((e) => SearchResultModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetSearchResultsModelToJson(
        GetSearchResultsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
