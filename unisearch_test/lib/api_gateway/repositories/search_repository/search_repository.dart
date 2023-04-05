import 'package:unisearch_test/features/search/data/dataSources/search_data_source.dart';
import 'package:unisearch_test/features/search/domain/entities/search_request_entity.dart';
import '../../../features/search/data/models/get_search_results_model.dart';
import '../../../features/search/domain/entities/get_search_results_entity.dart';

abstract class SearchRepository {
  Future<GetSearchResultsEntity?> getSearchData(SearchRequestEntity searchRequestEntity);
}

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _searchDataSource = SearchDataSourceImpl();

  SearchRepositoryImpl();

  @override
  Future<GetSearchResultsEntity?> getSearchData(SearchRequestEntity searchRequestEntity) async {
    final GetSearchResultsModel? _response = await _searchDataSource.getSearchData(searchRequestEntity);

    /// converting models to entities
    GetSearchResultsEntity? _searchEntity = _response!.toEntity();
    return _searchEntity;
  }
}
