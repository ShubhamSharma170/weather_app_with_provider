class WeatherDetailsModels {
  CurrentWeatherUnits? currentWeatherUnits;
  CurrentWeather? currentWeather;

  WeatherDetailsModels({this.currentWeatherUnits, this.currentWeather});

  WeatherDetailsModels.fromJson(Map<String, dynamic> json) {
    currentWeatherUnits =
        json['current_weather_units'] != null
            ? CurrentWeatherUnits.fromJson(json['current_weather_units'])
            : null;
    currentWeather =
        json['current_weather'] != null
            ? CurrentWeather.fromJson(json['current_weather'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currentWeatherUnits != null) {
      data['current_weather_units'] = currentWeatherUnits!.toJson();
    }
    if (currentWeather != null) {
      data['current_weather'] = currentWeather!.toJson();
    }
    return data;
  }
}

class CurrentWeatherUnits {
  String? time;
  String? interval;
  String? temperature;
  String? windspeed;
  String? winddirection;
  String? isDay;
  String? weathercode;

  CurrentWeatherUnits({
    this.time,
    this.interval,
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.isDay,
    this.weathercode,
  });

  CurrentWeatherUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    isDay = json['is_day'];
    weathercode = json['weathercode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['temperature'] = temperature;
    data['windspeed'] = windspeed;
    data['winddirection'] = winddirection;
    data['is_day'] = isDay;
    data['weathercode'] = weathercode;
    return data;
  }
}

class CurrentWeather {
  String? time;
  double? temperature;
  double? windspeed;
  int? winddirection;

  CurrentWeather({
    this.time,
    this.temperature,
    this.windspeed,
    this.winddirection,
  });

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature'] = temperature;
    data['windspeed'] = windspeed;
    data['winddirection'] = winddirection;
    return data;
  }
}
