class RiderModel {
  RiderModel({
    required this.riders,
  });
  late final List<Riders> riders;

  RiderModel.fromJson(Map<String, dynamic> json) {
    riders = List.from(json['Riders']).map((e) => Riders.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Riders'] = riders.map((e) => e.toJson()).toList();
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
    required this.mainColor,
  });
  late final int id;
  late final int teamId;
  late final String name;
  late final int number;
  late final String teamName;
  late final String imgFlag;
  late final String imgRider;
  late final String iconRider;
  late final String mainColor;

  Riders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    name = json['name'];
    number = json['number'];
    teamName = json['team_name'];
    imgFlag = json['img_flag'];
    imgRider = json['img_rider'];
    iconRider = json['icon_rider'];
    mainColor = json['main_color'];
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
    _data['main_color'] = mainColor;
    return _data;
  }
}
