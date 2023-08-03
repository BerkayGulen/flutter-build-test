class Contact {
  final String? name;
  final String? email;

  Contact({this.name, this.email});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json["NAME"] as String?, // Cast to String?
      email: json["EMAIL"] as String?, // Cast to String?
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "NAME": name,
      "EMAIL": email,
    };
  }

}
