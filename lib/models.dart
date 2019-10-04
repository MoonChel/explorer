import 'package:flutter/foundation.dart';

class Place {
  final String id;
  final String name;
  final String desciption;
  final OpenHours openHours;
  final String address;
  final Location localtion;
  final String mobileNumber;
  final String email;
  final Social social;

  Place({
    @required this.id,
    @required this.name,
    @required this.desciption,
    @required this.openHours,
    @required this.address,
    @required this.localtion,
    @required this.mobileNumber,
    @required this.email,
    @required this.social,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      desciption: json['desciption'],
      openHours: OpenHours.fromJson(json['openHours']),
      address: json['address'],
      localtion: Location.fromJson(json['localtion']),
      mobileNumber: json['mobileNumber'],
      email: json['email'],
      social: Social.fromJson(json['social']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desciption'] = this.desciption;
    data['openHours'] = this.openHours.toJson();
    data['address'] = this.address;
    data['localtion'] = this.localtion.toJson();
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    data['social'] = this.social.toJson();
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.days != null) {
      data['days'] = this.days.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Days {
  String name;
  int from;
  int to;

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
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    @required this.latitude,
    @required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': this.latitude,
      'longitude': this.longitude,
    };
  }
}

class Social {
  final String facebook;
  final String instagram;
  final String tripadvisor;

  Social({
    @required this.facebook,
    @required this.instagram,
    @required this.tripadvisor,
  });

  factory Social.fromJson(Map<String, dynamic> json) {
    return Social(
      facebook: json['facebook'],
      instagram: json['instagram'],
      tripadvisor: json['tripadvisor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facebook': this.facebook,
      'instagram': this.instagram,
      'tripadvisor': this.tripadvisor,
    };
  }
}
