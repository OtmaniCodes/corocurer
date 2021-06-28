import 'package:flutter/material.dart';

class Statistic {
  String continent;
  String country;
  int population;
  int activeCases;
  int recoveredCases;
  int deathsPerMillion;
  int testsPerMillion;
  int casesPerMillion;
  int totalCases;
  int totalDeaths;
  int totalTests;
  String publishedDateTime;

  Statistic({
    @required this.continent,
    @required this.country,
    @required this.activeCases,
    @required this.recoveredCases,
    @required this.publishedDateTime,
    @required this.deathsPerMillion,
    @required this.testsPerMillion,
    @required this.casesPerMillion,
    this.totalCases,
    this.totalDeaths,
    this.totalTests,
    this.population,
  });

  Statistic.fromJson({Map<String, dynamic> parsedJson}) {
    this.continent = parsedJson['continent'] ?? "Unknown";
    this.country = parsedJson["country"] ?? "Unknown";
    this.activeCases = parsedJson['cases']['active'] ?? 0;
    this.recoveredCases = parsedJson['cases']['recovered'] ?? 0;
    this.totalCases = parsedJson['cases']['total'] ?? 0;
    this.deathsPerMillion = parsedJson['deaths']['1M_pop'] ?? 0;
    this.population = parsedJson['population'] ?? 0;
    this.totalDeaths = parsedJson['deaths']['total'] ?? 0;
    this.testsPerMillion = parsedJson['tests']['1M_pop'] ?? 0;
    this.casesPerMillion = parsedJson['cases']['1M_pop'] ?? 0;
    this.publishedDateTime = parsedJson['day'] ?? "Unknown";
  }
}
