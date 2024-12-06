class Publisher {
  int id;
  String name;
  String email;
  String location;

  Publisher({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) {
    return Publisher(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown Name',
      email: json['email'] ?? 'Unknown Email',
      location: json['address'] != null
          ? '${json['address']['city']}, ${json['address']['street']}'
          : 'Unknown Location',
    );
  }
}
