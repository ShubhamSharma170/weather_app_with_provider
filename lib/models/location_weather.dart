class LocationWeatherModel {
  List<Results>? results;
  double? generationtimeMs;

  LocationWeatherModel({this.results, this.generationtimeMs});

  LocationWeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    generationtimeMs = json['generationtime_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['generationtime_ms'] = generationtimeMs;
    return data;
  }
}

class Results {
  String? name;
  double? latitude;
  double? longitude;

  String? timezone;

  String? country;

  Results({
    this.name,
    this.latitude,
    this.longitude,

    this.timezone,

    this.country,
  });

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];

    timezone = json['timezone'];

    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;

    data['timezone'] = timezone;

    data['country'] = country;
    return data;
  }
}
