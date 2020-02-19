class Role {
  int id;
  bool isAdmin;

  Role({
    this.id,
    this.isAdmin,
  });

  Role.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.isAdmin = json['admin'];
  }
}
