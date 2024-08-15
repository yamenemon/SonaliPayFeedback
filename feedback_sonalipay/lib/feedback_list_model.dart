class Complaint {
  final int id;
  final String name;
  final String email;
  final String? image;
  final String complain;
  final String createdAt;

  Complaint({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.complain,
    required this.createdAt,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      complain: json['complain'],
      createdAt: json['created_at'],
    );
  }
  static List<Complaint> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Complaint.fromJson(json)).toList();
  }
}
