class Covidstat {
  final String activecases;
  final String country;
  final String population;
  final String time;

  Covidstat(
      {required this.activecases,
      required this.country,
      required this.population,
      required this.time});

  factory Covidstat.fromJson(dynamic json) {
    return Covidstat(
        activecases: json['active'] ?? "",
        country: json['country'] as String,
        population: json['population'] ?? "",
        time: json['time']);
  }
  static List<Covidstat> covidstatFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Covidstat.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Stat{ country:$country, population: $population, active:$activecases, time: $time}';
  }
}
