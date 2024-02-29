class Tier {
  final int id;
  final String name;
  final String tel;
  final String email;
  final String town;
  final String adress;
  final String country;
  final String firstResp;
  final String emailFirstResp;
  final String logo;
  final bool archived;
  final String createdAt;
  final String updatedAt;
  final String vat;
  final String rne;

  Tier({
    required this.id,
    required this.name,
    required this.tel,
    required this.email,
    required this.town,
    required this.adress,
    required this.country,
    required this.firstResp,
    required this.emailFirstResp,
    required this.logo,
    required this.archived,
    required this.createdAt,
    required this.updatedAt,
    required this.vat,
    required this.rne,
  });

  factory Tier.fromJson(Map<String, dynamic> json) {
    return Tier(
      id: json['id'],
      name: json['name'] ?? '',
      tel: json['tel'] ?? '',
      email: json['email'] ?? '',
      town: json['town'] ?? '',
      adress: json['adress'] ?? '',
      country: json['country'] ?? '',
      firstResp: json['firstResp'] ?? '',
      emailFirstResp: json['emailFirstResp'] ?? '',
      logo: json['logo'] ?? '',
      archived: json['archived'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      vat: json['vat'] ?? '',
      rne: json['rne'] ?? '',
    );
  }
}
