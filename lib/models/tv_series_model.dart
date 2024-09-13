import 'dart:convert';

class TvSeriesModel {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    TvSeriesModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    TvSeriesModel copyWith({
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        TvSeriesModel(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory TvSeriesModel.fromRawJson(String str) => TvSeriesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TvSeriesModel.fromJson(Map<String, dynamic> json) => TvSeriesModel(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    bool adult;
    String backdropPath;
    List<int> genreIds;
    int id;
    List<OriginCountry> originCountry;
    OriginalLanguage originalLanguage;
    String originalName;
    String overview;
    double popularity;
    String posterPath;
    DateTime firstAirDate;
    String name;
    double voteAverage;
    int voteCount;

    Result({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalName,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.firstAirDate,
        required this.name,
        required this.voteAverage,
        required this.voteCount,
    });

    Result copyWith({
        bool? adult,
        String? backdropPath,
        List<int>? genreIds,
        int? id,
        List<OriginCountry>? originCountry,
        OriginalLanguage? originalLanguage,
        String? originalName,
        String? overview,
        double? popularity,
        String? posterPath,
        DateTime? firstAirDate,
        String? name,
        double? voteAverage,
        int? voteCount,
    }) => 
        Result(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            genreIds: genreIds ?? this.genreIds,
            id: id ?? this.id,
            originCountry: originCountry ?? this.originCountry,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalName: originalName ?? this.originalName,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            firstAirDate: firstAirDate ?? this.firstAirDate,
            name: name ?? this.name,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originCountry: List<OriginCountry>.from(json["origin_country"].map((x) => originCountryValues.map[x]!)),
        originalLanguage: originalLanguageValues.map[json["original_language"]]!,
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        name: json["name"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "origin_country": List<dynamic>.from(originCountry.map((x) => originCountryValues.reverse[x])),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date": "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

enum OriginCountry {
    CA,
    JP,
    KR,
    US
}

final originCountryValues = EnumValues({
    "CA": OriginCountry.CA,
    "JP": OriginCountry.JP,
    "KR": OriginCountry.KR,
    "US": OriginCountry.US
});

enum OriginalLanguage {
    EN,
    JA,
    KO
}

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "ja": OriginalLanguage.JA,
    "ko": OriginalLanguage.KO
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
