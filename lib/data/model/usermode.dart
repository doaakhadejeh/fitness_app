class Usermodel {
  final int id;
  final String name;

  Usermodel({
    required this.id,
    required this.name,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
