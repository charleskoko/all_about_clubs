class Club {
  String? id;
  String? name;
  String? country;
  int? value;
  String? image;
  int? europeanTitle;

  Club(
    this.id,
    this.name,
    this.country,
    this.value,
    this.image,
    this.europeanTitle,
  );

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    country = json['country'.toString()];
    value = json['value'];
    image = json['image'].toString();
    europeanTitle = json['european_title'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'value': value,
        'image': image,
        'europeanTitle': europeanTitle,
      };
}
