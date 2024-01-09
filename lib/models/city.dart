class City {
  late int id;
  late String name;
  late String subtitle;
  late String createdAt;
  late String text;
  late String label;
  late String picture;
  late String detailPicture;
  late List<String> decoverySite;
  late String titleEmblematicPlaces;
  late List<String> emblematicPlaces;
  late bool enable;

  City({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.createdAt,
    required this.text,
    required this.label,
    required this.picture,
    required this.detailPicture,
    required this.decoverySite,
    required this.titleEmblematicPlaces,
    required this.emblematicPlaces,
    required this.enable,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subtitle = json['subtitle'];
    createdAt = json['createdAt'];
    text = json['text'];
    label = json['label'];
    picture = json['picture'];
    detailPicture = json['detailPicture'];
    decoverySite = List<String>.from(json["decoverySite"].map((x) => x));
    titleEmblematicPlaces = json['titleEmblematicPlaces'];
    emblematicPlaces =
        List<String>.from(json["emblematicPlaces"].map((x) => x));
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['subtitle'] = subtitle;
    data['createdAt'] = createdAt;
    data['text'] = text;
    data['label'] = label;
    data['picture'] = picture;
    data['detailPicture'] = detailPicture;
    data['decoverySite'] = List<String>.from(decoverySite.map((x) => x));
    data['titleEmblematicPlaces'] = titleEmblematicPlaces;
    data['emblematicPlaces'] =
        List<String>.from(emblematicPlaces.map((x) => x));
    data['enable'] = enable;
    return data;
  }

  @override
  String toString() {
    return '{"id":$id,"name":$name,"subtitle":$subtitle,"createdAt":$createdAt,"text":$text,"label":$label,"picture":$picture,"detailPicture": $detailPicture, "decoverySite":${decoverySite.toString()},"titleEmblematicPlaces":$titleEmblematicPlaces,"emblematicPlaces":${emblematicPlaces.toString()},"enable":$enable}';
  }
}
