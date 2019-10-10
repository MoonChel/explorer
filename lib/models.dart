import 'package:intl/intl.dart';

class Place {
  String id;
  String name;
  String subtitle;
  String desciption;
  Address address;
  PlaceIcon icon;
  ColorSettings colorSettings;
  List<String> images;
  OpenHours openHours;
  Localtion localtion;
  String mobileNumber;
  String email;
  Social social;

  Place(
      {this.id,
      this.name,
      this.subtitle,
      this.desciption,
      this.address,
      this.icon,
      this.colorSettings,
      this.images,
      this.openHours,
      this.localtion,
      this.mobileNumber,
      this.email,
      this.social});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subtitle = json['subtitle'];
    desciption = json['desciption'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    icon = json['icon'] != null ? new PlaceIcon.fromJson(json['icon']) : null;
    colorSettings = json['colorSettings'] != null
        ? new ColorSettings.fromJson(json['colorSettings'])
        : null;
    images = json['images'].cast<String>();
    openHours = json['openHours'] != null
        ? new OpenHours.fromJson(json['openHours'])
        : null;
    localtion = json['localtion'] != null
        ? new Localtion.fromJson(json['localtion'])
        : null;
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    social =
        json['social'] != null ? new Social.fromJson(json['social']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['subtitle'] = this.subtitle;
    data['desciption'] = this.desciption;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.icon != null) {
      data['icon'] = this.icon.toJson();
    }
    if (this.colorSettings != null) {
      data['colorSettings'] = this.colorSettings.toJson();
    }
    data['images'] = this.images;
    if (this.openHours != null) {
      data['openHours'] = this.openHours.toJson();
    }
    if (this.localtion != null) {
      data['localtion'] = this.localtion.toJson();
    }
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    if (this.social != null) {
      data['social'] = this.social.toJson();
    }
    return data;
  }
}

class Address {
  String city;
  String street;
  String postIndex;
  String country;

  Address({this.city, this.street, this.postIndex, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    street = json['street'];
    postIndex = json['postIndex'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['street'] = this.street;
    data['postIndex'] = this.postIndex;
    data['country'] = this.country;
    return data;
  }

  String get shortAddress {
    return "${this.street}, ${this.postIndex}, ${this.city}";
  }

  String get fullAddress {
    return "${this.street}, ${this.postIndex}, ${this.city}, ${this.country}";
  }
}

class PlaceIcon {
  bool isSVG;
  String url;
  int colorHex;

  PlaceIcon({this.isSVG, this.url, this.colorHex});

  PlaceIcon.fromJson(Map<String, dynamic> json) {
    isSVG = json['isSVG'];
    url = json['url'];
    colorHex = int.parse(json['colorHex']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSVG'] = this.isSVG;
    data['url'] = this.url;
    data['colorHex'] = this.colorHex;
    return data;
  }
}

class ColorSettings {
  int headerColorHex;
  int bodyColorHex;
  int fontColor;

  ColorSettings({this.headerColorHex, this.bodyColorHex, this.fontColor});

  ColorSettings.fromJson(Map<String, dynamic> json) {
    headerColorHex = int.parse(json['headerColorHex']);
    bodyColorHex = int.parse(json['bodyColorHex']);
    fontColor = int.parse(json['fontColor']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headerColorHex'] = this.headerColorHex.toString();
    data['bodyColorHex'] = this.bodyColorHex.toString();
    data['fontColor'] = this.fontColor.toString();
    return data;
  }
}

class OpenHours {
  List<Days> days;

  OpenHours({this.days});

  OpenHours.fromJson(Map<String, dynamic> json) {
    if (json['days'] != null) {
      days = new List<Days>();
      json['days'].forEach((v) {
        days.add(new Days.fromJson(v));
      });
    }
  }

  get intToDay => [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
      ];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.days != null) {
      data['days'] = this.days.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String opensTodayFrom() {
    var now = DateTime.now();
    return days.firstWhere((day) => day.name == intToDay[now.weekday - 1]).from;
  }
}

class Days {
  String name;
  String from;
  String to;

  Days({this.name, this.from, this.to});

  Days.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }

  @override
  String toString() {
    var repr = "$name: $from - $to";
    var weekDay = DateFormat.EEEE().format(DateTime.now()).toString();

    if (weekDay == name) {
      repr += " (Today)";
    }

    return repr;
  }
}

class Localtion {
  double latitude;
  double longitude;

  Localtion({this.latitude, this.longitude});

  Localtion.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Social {
  String facebook;
  String instagram;
  String tripadvisor;

  Social({this.facebook, this.instagram, this.tripadvisor});

  Social.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    tripadvisor = json['tripadvisor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['tripadvisor'] = this.tripadvisor;
    return data;
  }
}
