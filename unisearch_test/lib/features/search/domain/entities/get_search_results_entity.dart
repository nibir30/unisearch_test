import '../../data/models/get_search_results_model.dart';
import '../../data/models/search_result_model.dart';
import 'search_result_entity.dart';

class GetSearchResultsEntity {
  List<SearchResultEntity>? results;

  GetSearchResultsEntity(
    this.results,
  );

  GetSearchResultsModel toModel() {
    List<SearchResultModel>? searchModel = [];

    for (var i = 0; i < results!.length; i++) {
      searchModel.add(results![i].toModel());
    }
    return GetSearchResultsModel(
      searchModel,
    );
  }
}
