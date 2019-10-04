import 'package:flutter_test/flutter_test.dart';
import 'package:explorer/models.dart';

main() {
  test('Serialize from json', () {
    var json = {
      "id": "f4815217-118d-43df-9c42-9e0c26a32ff4",
      "name": "wh",
      "desciption": "test",
      "openHours": {
        "days": [
          {"name": "Monday", "from": 0, "to": 10},
          {"name": "Tuesday", "from": 0, "to": 10},
          {"name": "Wednesday", "from": 0, "to": 10},
          {"name": "Thursday", "from": 0, "to": 10},
          {"name": "Friday", "from": 0, "to": 10},
          {"name": "Saturday", "from": 0, "to": 10},
          {"name": "Sunday", "from": 0, "to": 10},
        ]
      },
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
