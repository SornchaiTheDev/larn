class Larn {
  String id;
  String name;
  String description;
  String image;
  List<String>? appList;

  Larn({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    this.appList,
  });
}
