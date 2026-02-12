class Session {
  final String id;
  final String name;
  final String status;
  final String uptime;

  Session({
    required this.id,
    required this.name,
    required this.status,
    required this.uptime,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      uptime: json['uptime'] as String,
    );
  }
}
