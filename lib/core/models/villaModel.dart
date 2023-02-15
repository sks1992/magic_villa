class VillaModel {
  VillaModel({
    this.id,
    this.name,
    this.occupancy,
    this.sqft,
    this.isSuccess = false,
    this.message = "",
  });

  late final int? id;
  late final String? name;
  late final int? occupancy;
  late final int? sqft;
  late bool isSuccess;
  late String message;

  VillaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    occupancy = json['occupancy'];
    sqft = json['sqft'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['occupancy'] = occupancy;
    data['sqft'] = sqft;
    return data;
  }
}
