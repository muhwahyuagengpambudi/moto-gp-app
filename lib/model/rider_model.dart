class RiderModel {
  RiderModel({
    required this.riders,
  });
  late final List<Riders> riders;

  RiderModel.fromJson(Map<String, dynamic> json) {
    riders = List.from(json['riders']).map((e) => Riders.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['riders'] = riders.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Riders {
  Riders({
    required this.id,
    required this.teamId,
    required this.name,
    required this.number,
    required this.teamName,
    required this.imgFlag,
    required this.imgRider,
    required this.iconRider,
  });
  int? id;
  int? teamId;
  String? name;
  int? number;
  String? teamName;
  String? imgFlag;
  String? imgRider;
  String? iconRider;

  Riders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    name = json['name'];
    number = json['number'];
    teamName = json['team_name'];
    imgFlag = json['img_flag'];
    imgRider = json['img_rider'];
    iconRider = json['icon_rider'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['name'] = name;
    _data['number'] = number;
    _data['team_name'] = teamName;
    _data['img_flag'] = imgFlag;
    _data['img_rider'] = imgRider;
    _data['icon_rider'] = iconRider;
    return _data;
  }
}
