import 'dart:convert';

import 'package:unisearch_test/api_gateway/api_collection/search_api/search_api.dart';
import 'package:unisearch_test/features/search/data/models/get_search_results_model.dart';
import 'package:unisearch_test/features/search/domain/entities/search_request_entity.dart';

import 'package:http/http.dart' as http;

abstract class SearchDataSource {
  Future<GetSearchResultsModel?> getSearchData(SearchRequestEntity profileRequestDataEntity);
}

class SearchDataSourceImpl implements SearchDataSource {
  final SearchApi _getSearchDataApi = SearchApi();

  SearchDataSourceImpl();

  @override
  Future<GetSearchResultsModel?> getSearchData(SearchRequestEntity profileRequestDataEntity) async {
    String url = 'http://universities.hipolabs.com/search';
    if (profileRequestDataEntity.varsityName != null) {
      url = 'http://universities.hipolabs.com/search?name=' + profileRequestDataEntity.varsityName.toString();
    } else {
      url = 'http://universities.hipolabs.com/search';
    }
    final response = await http.get(Uri.parse(url));
    final List<Map<String, dynamic>> body = List<Map<String, dynamic>>.from(json.decode(response.body));
    GetSearchResultsModel _response = _getSearchDataApi.listMapResponse(body);
    return _response;
  }
}
