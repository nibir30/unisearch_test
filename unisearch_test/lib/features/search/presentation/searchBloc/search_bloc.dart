import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:unisearch_test/api_gateway/repositories/search_repository/search_repository.dart';
import 'package:unisearch_test/features/search/domain/usecase/search_usecase.dart';
import '../../domain/entities/get_search_results_entity.dart';
import '../../domain/entities/search_request_entity.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<RequestSearchEvent>(_onRequestSearch);
  }

  Future<void> _onRequestSearch(final RequestSearchEvent event, final Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    final SearchRepository _repository = SearchRepositoryImpl();
    final SearchUseCase _useCase = SearchUseCase(searchRepository: _repository);
    final GetSearchResultsEntity? _entity = await _useCase.getSearchData(event.searchRequestEntity);

    if (_entity != null) {
      emit(SearchCreatedState(_entity));
    } else {
      emit(SearchErrorState("Unable to send Search Data"));
    }
  }
}
