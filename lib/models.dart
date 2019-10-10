import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Place {
  final String id;
  final String name;
  final String subtitle;
  final String desciption;
  final PlaceIcon icon;
  final OpenHours openHours;
  final PlaceAddress address;
  final Location localtion;
  final String mobileNumber;
  final String email;
  final Social social;
  final List<String> images;
  final ColorSettings colorSettings;

  const Place({
    @required this.id,
    @required this.name,
    @required this.subtitle,
    @required this.desciption,
    @required this.icon,
    @required this.openHours,
    @required this.address,
    @required this.localtion,
    @required this.mobileNumber,
    @required this.email,
    @required this.social,
    @required this.images,
    @required this.colorSettings,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      subtitle: json['subtitle'],
      desciption: json['desciption'],
      icon: PlaceIcon.fromJson(json['icon']),
      openHours: OpenHours.fromJson(json['openHours']),
      address: json['address'],
      localtion: Location.fromJson(json['localtion']),
      mobileNumber: json['mobileNumber'],
      email: json['email'],
      social: Social.fromJson(json['social']),
      images: json['images'],
      colorSettings: ColorSettings.fromJson(json['colorSettings']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['subtitle'] = this.subtitle;
    data['desciption'] = this.desciption;
    data['icon'] = this.icon;
    data['openHours'] = this.openHours.toJson();
    data['address'] = this.address;
    data['localtion'] = this.localtion.toJson();
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    data['social'] = this.social.toJson();
    data['images'] = this.images;
    return data;
  }
}

class PlaceAddress {
  final String city;
  final String street;
  final String postIndex;
  final String country;

  const PlaceAddress({this.city, this.country, this.postIndex, this.street});

  factory PlaceAddress.fromJson(Map<String, dynamic> json) {
    return PlaceAddress(
      city: json['city'],
      street: json['street'],
      postIndex: json['postIndex'],
      country: json['country'],
    );
  }

  String get shortAddress {
    return "${this.street}, ${this.postIndex}, ${this.city}";
  }

  String get fullAddress {
    return "${this.street}, ${this.postIndex}, ${this.city}, ${this.country}";
  }
}

class PlaceIcon {
  final String url;
  final bool isSVG;
  final int colorHex;

  const PlaceIcon({
    this.url,
    this.colorHex = 0xffffffff,
    this.isSVG = false,
  });

  factory PlaceIcon.fromJson(Map<String, dynamic> json) {
    return PlaceIcon(
      url: json["url"],
      isSVG: json["isSWG"],
    );
  }
}

class ColorSettings {
  final int headerColorHex;
  final int bodyColorHex;
  final int fontColor;

  const ColorSettings({
    @required this.headerColorHex,
    @required this.bodyColorHex,
    this.fontColor = 0xffffffff,
  });

  factory ColorSettings.fromJson(Map<String, dynamic> json) {
    return ColorSettings(
      headerColorHex: int.parse(json['headerColorHex']),
      bodyColorHex: int.parse(json['bodyColorHex']),
    );
  }
}

const intToDay = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

class OpenHours {
  final List<Day> days;

  const OpenHours({this.days});

  factory OpenHours.fromJson(List<dynamic> json) {
    List<Day> days;

    json.forEach((v) {
      days.add(Day.fromJson(v));
    });

    return OpenHours(days: days);
  }

  List<Map<String, dynamic>> toJson() {
    return this.days.map((v) => v.toJson()).toList();
  }

  String opensTodayFrom() {
    var now = DateTime.now();
    return days.firstWhere((day) => day.name == intToDay[now.weekday - 1]).from;
  }
}

class Day {
  final String name;
  final String from;
  final String to;

  const Day({this.name, this.from, this.to});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      name: json['name'],
      from: json['from'],
      to: json['to'],
    );
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

class Location {
  final double latitude;
  final double longitude;

  const Location({
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

  const Social({
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
