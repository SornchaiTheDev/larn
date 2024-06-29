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

  factory Larn.fromJson(Map<String, dynamic> json) {
    return Larn(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      image: json['image_url'],
      appList: List<String>.from([]),
    );
  }
}
