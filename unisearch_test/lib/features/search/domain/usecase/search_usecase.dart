import 'package:unisearch_test/api_gateway/repositories/search_repository/search_repository.dart';
import 'package:unisearch_test/features/search/domain/entities/search_request_entity.dart';

import '../entities/get_search_results_entity.dart';

class SearchUseCase {
  final SearchRepository searchRepository;
  SearchUseCase({required this.searchRepository});

  Future<GetSearchResultsEntity?> getSearchData(SearchRequestEntity searchRequestEntity) async {
    return await searchRepository.getSearchData(searchRequestEntity);
  }
}
