class UserModel {
  final String id;
  final String email;
  final String current_plan;
  final String current_date;
  final String current_scanned;

  UserModel({
    required this.id,
    required this.email,
    required this.current_plan,
    required this.current_date,
    required this.current_scanned,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      current_plan: json['current_plan'],
      current_date: json['current_date'],
      current_scanned: json['current_scanned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'current_plan': current_plan,
      'current_date': current_date,
      'current_scanned': current_scanned,
    };
  }
}
