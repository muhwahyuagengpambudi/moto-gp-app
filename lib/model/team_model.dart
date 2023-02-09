class TeamModel {
  List<Teams>? teams;

  TeamModel({this.teams});

  TeamModel.fromJson(Map<String, dynamic> json) {
    if (json['Teams'] != null) {
      teams = <Teams>[];
      json['Teams'].forEach((v) {
        teams!.add(new Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teams != null) {
      data['Teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  int? id;
  String? name;
  String? bike;
  String? imgBike;
  String? mainColor;

  Teams({this.id, this.name, this.bike, this.imgBike, this.mainColor});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bike = json['bike'];
    imgBike = json['img_bike'];
    mainColor = json['main_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bike'] = this.bike;
    data['img_bike'] = this.imgBike;
    data['main_color'] = this.mainColor;
    return data;
  }
}
