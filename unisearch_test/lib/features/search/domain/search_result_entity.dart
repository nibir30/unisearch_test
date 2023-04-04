import '../data/search_result_model.dart';

class SearchResultEntity {
  String? state_province;
  List<String>? web_pages;
  String? country;
  String? name;
  String? alpha_two_code;
  List<String>? domains;

  SearchResultEntity(
    this.state_province,
    this.web_pages,
    this.country,
    this.name,
    this.alpha_two_code,
    this.domains,
  );

  SearchResultModel toModel() => SearchResultModel(
        state_province,
        web_pages,
        country,
        name,
        alpha_two_code,
        domains,
      );
}
