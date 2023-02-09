class TeamModel {
  List<Data>? data;

  TeamModel({this.data});

  TeamModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? bike;
  String? imgBike;
  String? mainColor;
  int? teamStandings;
  int? teamPoints;
  Null? createdAt;
  String? updatedAt;
  List<Rider>? rider;

  Data(
      {this.id,
      this.name,
      this.bike,
      this.imgBike,
      this.mainColor,
      this.teamStandings,
      this.teamPoints,
      this.createdAt,
      this.updatedAt,
      this.rider});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bike = json['bike'];
    imgBike = json['img_bike'];
    mainColor = json['main_color'];
    teamStandings = json['team_standings'];
    teamPoints = json['team_points'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['rider'] != null) {
      rider = <Rider>[];
      json['rider'].forEach((v) {
        rider!.add(new Rider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bike'] = this.bike;
    data['img_bike'] = this.imgBike;
    data['main_color'] = this.mainColor;
    data['team_standings'] = this.teamStandings;
    data['team_points'] = this.teamPoints;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.rider != null) {
      data['rider'] = this.rider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rider {
  int? id;
  int? teamId;
  String? name;
  int? number;
  String? imgFlag;
  String? imgRider;
  String? iconRider;
  String? dateOfBrith;
  String? placeOfBrith;
  int? height;
  int? weight;
  int? gpVictories;
  int? worldchampionships;
  String? createdAt;
  String? updatedAt;

  Rider(
      {this.id,
      this.teamId,
      this.name,
      this.number,
      this.imgFlag,
      this.imgRider,
      this.iconRider,
      this.dateOfBrith,
      this.placeOfBrith,
      this.height,
      this.weight,
      this.gpVictories,
      this.worldchampionships,
      this.createdAt,
      this.updatedAt});

  Rider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    name = json['name'];
    number = json['number'];
    imgFlag = json['img_flag'];
    imgRider = json['img_rider'];
    iconRider = json['icon_rider'];
    dateOfBrith = json['date_of_brith'];
    placeOfBrith = json['place_of_brith'];
    height = json['height'];
    weight = json['weight'];
    gpVictories = json['gp_victories'];
    worldchampionships = json['worldchampionships'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['team_id'] = this.teamId;
    data['name'] = this.name;
    data['number'] = this.number;
    data['img_flag'] = this.imgFlag;
    data['img_rider'] = this.imgRider;
    data['icon_rider'] = this.iconRider;
    data['date_of_brith'] = this.dateOfBrith;
    data['place_of_brith'] = this.placeOfBrith;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['gp_victories'] = this.gpVictories;
    data['worldchampionships'] = this.worldchampionships;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
