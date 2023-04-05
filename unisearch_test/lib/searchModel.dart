class SearchModel {
  String? state_province;
  // List<String>? web_pages;
  String? country;
  String? name;
  String? alpha_two_code;
  // List<String>? domains;

  SearchModel({
    this.state_province,
    // this.web_pages,
    this.country,
    this.name,
    this.alpha_two_code,
    // this.domains,
  });

  static SearchModel fromJson(json) => SearchModel(
        state_province: json['state_province'],
        // web_pages: json['web_pages'],
        country: json['country'],
        name: json['name'],
        alpha_two_code: json['alpha_two_code'],
        // domains: json['domains'],
      );
}
