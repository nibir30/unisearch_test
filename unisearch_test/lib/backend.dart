import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    if (query.isEmpty && query.length < 3) {
      print('Query needs to be at least 3 chars');
      return Future.value([]);
    }
    var url = Uri.https('universities.hipolabs.com', '/search', {'name': query});

    var response = await http.get(url);
    List<Suggestion> suggestions = [];
    if (response.statusCode == 200) {
      Iterable json = convert.jsonDecode(response.body);
      suggestions = List<Suggestion>.from(json.map((model) => Suggestion.fromJson(model)));

      print('Number of suggestion: ${suggestions.length}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return Future.value(suggestions
        .map((e) => {
              'state-province': e.state_province.toString(),
              // 'web_pages': e.web_pages.toString(),
              'country': e.country.toString(),
              'name': e.name.toString(),
              'alpha_two_code': e.alpha_two_code.toString(),
              // 'domains': e.domains.toString(),
            })
        .toList());
  }
}

class Suggestion {
  String? state_province;
  // List<String>? web_pages;
  String? country;
  String? name;
  String? alpha_two_code;
  // List<String>? domains;

  Suggestion({
    this.state_province,
    // this.web_pages,
    this.country,
    this.name,
    this.alpha_two_code,
    // this.domains,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      state_province: json['state-province'],
      // web_pages: json['web_pages'],
      country: json['country'],
      name: json['name'],
      alpha_two_code: json['alpha_two_code'],
      // domains: json['domains'],
    );
  }
}

// // Map s = {
// //   "state-province": null,
// //   "web_pages": ["http://www.hunnu.edu.cn/"],
// //   "country": "China",
// //   "name": "Hunan Normal University",
// //   "alpha_two_code": "CN",
// //   "domains": ["hunnu.edu.cn"]
// // };

// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class BackendService {
//   static Future<List<Map<String, String>>> getSuggestions(String query) async {
//     if (query.isEmpty && query.length < 3) {
//       print('Query needs to be at least 3 chars');
//       return Future.value([]);
//     }
//     var url = Uri.https('api.datamuse.com', '/sug', {'s': query});

//     var response = await http.get(url);
//     List<Suggestion> suggestions = [];
//     if (response.statusCode == 200) {
//       Iterable json = convert.jsonDecode(response.body);
//       suggestions = List<Suggestion>.from(json.map((model) => Suggestion.fromJson(model)));

//       print('Number of suggestion: ${suggestions.length}.');
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }

//     return Future.value(suggestions.map((e) => {'name': e.word, 'score': e.score.toString()}).toList());
//   }
// }

// class Suggestion {
//   final int score;
//   final String word;

//   Suggestion({
//     required this.score,
//     required this.word,
//   });

//   factory Suggestion.fromJson(Map<String, dynamic> json) {
//     return Suggestion(
//       word: json['word'],
//       score: json['score'],
//     );
//   }
// }
