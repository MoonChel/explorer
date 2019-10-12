import 'package:flutter_test/flutter_test.dart';
import 'package:explorer/models.dart';

main() {
  test('Serialize from json', () {
    var json = {
      "id": "ef6a9612-8c9b-4db7-b35f-836ed4b8601c",
      "name": "Jekyll & Hyde",
      "subtitle": "",
      "desciption":
          "Přijďte do Jekylla na úžasný drink a na vlastní oči pozorujte, jak vznikají ingredience, které v něm jsou.",
      "address": {
        "city": "Brno",
        "street": "Josefská 7",
        "postIndex": "602 00",
        "country": "Česká republika"
      },
      "icon": {
        "url": "https://ibb.co/qghmDN6",
      },
      "colorSettings": {
        "headerColorHex": "0xff0F0F0F",
        "bodyColorHex": "0xffffffff",
        "fontColor": "0xff1A1A1A"
      },
      "images": [
        "https://jhbar.webnode.cz/_files/200000032-a6f81a7edf/1-1.jpg",
        "https://jhbar.webnode.cz/_files/200000033-30c0131b90/1-2-0.jpg",
        "https://jhbar.webnode.cz/_files/200000034-3452f354b8/1-3.jpg",
        "https://jhbar.webnode.cz/_files/200000035-92a73939be/1-4.jpg",
        "https://jhbar.webnode.cz/_files/200000036-e5ecfe6ecf/1-6.jpg"
      ],
      "openHours": {
        "days": [
          {"name": "Monday", "from": "6PM", "to": "2AM"},
          {"name": "Tuesday", "from": "6PM", "to": "2AM"},
          {"name": "Wednesday", "from": "6PM", "to": "2AM"},
          {"name": "Thursday", "from": "6PM", "to": "2AM"},
          {"name": "Friday", "from": "6PM", "to": "2AM"},
          {"name": "Saturday", "from": "6PM", "to": "2AM"},
        ]
      },
      "mobileNumber": "+420 608 689 173",
      "email": "jekyll@jhbar.cz",
      "localtion": {"latitude": 20.0, "longitude": 50.0},
      "social": {
        "facebook": "https://www.facebook.com/jhbar.cz",
        "tripadvisor":
            "https://www.tripadvisor.com/Attraction_Review-g274714-d17782046-Reviews-Jekyll_Hyde-Brno_South_Moravian_Region_Moravia.html?m=19905",
        "instagram": "https://www.instagram.com/jekyll_a_hyde/"
      }
    };
    Place.fromJson(json);
  });
}
