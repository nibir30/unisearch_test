import 'package:unisearch_test/features/search/data/models/search_result_model.dart';

import '../../../features/search/data/models/get_search_results_model.dart';

class SearchApi {
  GetSearchResultsModel listMapResponse(List<Map<String, dynamic>>? responseJson) {
    List<SearchResultModel> list = [];

    for (var i = 0; i < responseJson!.length; i++) {
      /// converting json data to model
      final SearchResultModel _singleResult = SearchResultModel.fromJson(responseJson[i]);
      list.add(_singleResult);
    }

    GetSearchResultsModel _response = GetSearchResultsModel(list);

    return _response;
  }
}
