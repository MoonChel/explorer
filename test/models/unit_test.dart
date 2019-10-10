import 'package:flutter_test/flutter_test.dart';
import 'package:explorer/models.dart';

main() {
  test('Serialize from json', () {
    var json = {
      "id": "f4815217-118d-43df-9c42-9e0c26a32ff4",
      "name": "wh",
      "desciption": "test",
      "images": [
        "https://www.whiskeyprovsechny.cz/images/foto_6_big.jpg",
        "https://www.whiskeyprovsechny.cz/images/foto_2_big.jpg",
        "https://www.whiskeyprovsechny.cz/images/foto_7_big.jpg",
        "https://www.whiskeyprovsechny.cz/images/foto_4_big.jpg",
        "https://www.whiskeyprovsechny.cz/images/foto_1_big.jpg",
      ],
      "openHours": [
        {"name": "Monday", "from": "5am", "to": "12pm"},
        {"name": "Tuesday", "from": "5am", "to": "12pm"},
        {"name": "Wednesday", "from": "5am", "to": "12pm"},
        {"name": "Thursday", "from": "5am", "to": "12pm"},
        {"name": "Friday", "from": "5am", "to": "12pm"},
        {"name": "Saturday", "from": "5am", "to": "12pm"},
        {"name": "Sunday", "from": "5am", "to": "12pm"},
      ],
      "address": "add res s",
      "localtion": {"latitude": 20.0, "longitude": 50.1},
      "mobileNumber": "+42024323",
      "email": "e@k.com",
      "social": {
        "facebook": "facebook.com",
        "instagram": "instagram.com",
        "tripadvisor": "tripadvisor.com"
      }
    };
    var place = Place.fromJson(json);

    expect(place.id, "f4815217-118d-43df-9c42-9e0c26a32ff4");
    expect(place.localtion.latitude, 20.0);
    expect(place.social.facebook, "facebook.com");
    expect(place.openHours.days[0].name, "Monday");
  });
}
