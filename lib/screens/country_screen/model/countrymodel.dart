import 'package:json_country_app/screens/country_screen/model/countrymodel.dart';


class CountryModel
{
  String? status,region,subregion,flag;
  bool? independent;
  int? population;

  List? capital = [];
  List? altSpellings = [];
  List? timezones = [];
  List? continents = [];

  NameModel? nameModel;
  //CurrenciesModel? currenciesModel;
  MapsModel? mapsModel;
  FlagModel? flagModel;

  CountryModel(
      {this.status,
      this.region,
      this.subregion,
      this.flag,
      this.independent,
      this.population,
      this.nameModel,
      //this.currenciesModel,
      this.capital,
      this.altSpellings,
      this.timezones,
      this.continents,
      this.mapsModel,
      this.flagModel});

  CountryModel countryFromJson(Map m1)
  {
    status = m1['status'];
    region = m1['region'];
    subregion = m1['subregion'];
    flag = m1['flag'];
    independent = m1['independent'];
    population = m1['population'];

    capital = m1['capital'];
    altSpellings = m1['altSpellings'];
    timezones = m1['timezones'];
    continents = m1['continents'];

    nameModel = NameModel().nameFromJson(m1['name']);
    //currenciesModel = CurrenciesModel().currenciesFromJson(m1['currencies']);
    mapsModel = MapsModel().mapFromJson(m1['maps']);
    flagModel = FlagModel().flagFromJson(m1['flags']);

    CountryModel countryModel = CountryModel(
      status: status,
      flag: flag,
      region: region,
      subregion: subregion,
      independent: independent,
      population: population,
      altSpellings: altSpellings,
      capital: capital,
      continents: continents,
      timezones: timezones,
      //currenciesModel: currenciesModel,
      flagModel: flagModel,
      mapsModel: mapsModel,
      nameModel: nameModel,
    );

    return countryModel;


  }
}

class NameModel
{
  String? common,official;
  NameModel({this.common, this.official});

  NameModel nameFromJson(Map m1)
  {
    common = m1['common'];
    official = m1['official'];
    NameModel n1 = NameModel(common: common,official: official);
    return n1;
  }

}

// class CurrenciesModel
// {
//   BBDModel? bbdModel;
//   CurrenciesModel({this.bbdModel});
//
//   CurrenciesModel currenciesFromJson(Map m1)
//   {
//     bbdModel = BBDModel().bbdFromJson(m1['BBD']);
//     CurrenciesModel c1 = CurrenciesModel(bbdModel: bbdModel);
//     return c1;
//   }
//
// }
// class BBDModel
// {
//   String? name,symbol;
//   BBDModel({this.name, this.symbol});
//
//   BBDModel bbdFromJson(Map m1)
//   {
//     name = m1['name'];
//     symbol = m1['symbol'];
//     BBDModel b1 = BBDModel(name: name,symbol: symbol);
//     return b1;
//   }
//
// }

class MapsModel
{
  String? googleMaps,openStreetMaps;
  MapsModel({this.googleMaps, this.openStreetMaps});

  MapsModel mapFromJson(Map m1)
  {
    googleMaps = m1['googleMaps'];
    googleMaps = m1['openStreetMaps'];
    MapsModel map1 = MapsModel(googleMaps: googleMaps,openStreetMaps: openStreetMaps);
    return map1;
  }

}

class FlagModel
{
  String? png,alt;
  FlagModel({this.png, this.alt});

  FlagModel flagFromJson(Map m1)
  {
    png = m1['png'];
    alt = m1['alt'];
    FlagModel f1 = FlagModel(alt: alt,png: png);
    return f1;
  }
}