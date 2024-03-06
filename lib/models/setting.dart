class Setting {
  final int id;
  final String pictureSVG;
  final String title;
  final String subtitle;

  Setting({
    required this.id,
    required this.pictureSVG,
    required this.title,
    required this.subtitle,
  });

  @override
  String toString() {
    return '{"id":$id,"pictureSVG":$pictureSVG,"title": $title, "subtitle":$subtitle}';
  }
}
