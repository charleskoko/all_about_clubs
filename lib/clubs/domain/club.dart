class Club {
  String? id;
  String? name;
  String? country;
  int? value;
  String? image;
  int? europeanTitles;

  Club(
    this.id,
    this.name,
    this.country,
    this.value,
    this.image,
    this.europeanTitles,
  );

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    country = json['country'].toString();
    value = json['value'];
    image = json['image'].toString();
    europeanTitles = json['european_titles'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'value': value,
        'image': image,
        'european_titles': europeanTitles,
      };
}
