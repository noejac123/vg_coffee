class CoffeePic {
  CoffeePic(this.file);

  factory CoffeePic.fromJson(Map<String, dynamic> json) {
    return CoffeePic(json['file'] as String);
  }

  final String file;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'uri': file};
  }
}
