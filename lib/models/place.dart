class Place {
  late int id;
  late String title;
  late String description;
  late String firstImage;
  late String secondImage;

  Place({
    required this.id,
    required this.title,
    required this.description,
    required this.firstImage,
    required this.secondImage,
  });

  @override
  String toString() {
    return '{"id":$id,"title":$title,"description":$description,"firstImage": $firstImage,"secondImage":$secondImage }';
  }
}
