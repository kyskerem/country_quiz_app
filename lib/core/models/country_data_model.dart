class CountryData {
  String? name;
  String? capital;

  CountryData({this.name, this.capital});

  CountryData.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    capital = json["capital"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['capital'] = capital;

    return data;
  }
}

class ListData {
  static final List<CountryData> countryDataList = [];
  ListData();

  ListData.fromJson(List json) {
    for (Map<String, dynamic> data in json) {
      countryDataList.add(CountryData.fromJson(data));
    }
  }

  ListData.removeFromList(CountryData countryToRemove) {
    countryDataList.remove(countryToRemove);
  }
}
