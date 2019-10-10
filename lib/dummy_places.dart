import 'package:explorer/models.dart';

const dummyPlaces = [
  Place(
    id: "cb83e69e-6acf-4273-857e-9f4c9b64d4c5",
    name: "Whiskey bar",
    subtitle: "Který neexistuje",
    desciption:
        "Jste nároční. Milujete pivo s pěnou jako křen, netuctovou whisky a barmana, co jí rozumí. Z kuchyně vůni, které nejde odolat, a koktejl, když se Vám chce slavit. Jednou chcete sedět sami a jindy s sebou vezmete celou rodinu a pět přátel navíc.",
    address: PlaceAddress(
      city: "Brno",
      street: "Gorkého 98/58",
      postIndex: "602 00",
      country: "Česká republika",
    ),
    icon: PlaceIcon(
      isSVG: true,
      url: "https://www.whiskeyprovsechny.cz/images/wkey_logo_web.svg",
    ),
    colorSettings: ColorSettings(
      headerColorHex: 0xff326c58,
      bodyColorHex: 0xfff9f6cb,
      fontColor: 0xff326c58,
    ),
    images: [
      "https://www.whiskeyprovsechny.cz/images/foto_1_big.jpg",
      "https://www.whiskeyprovsechny.cz/images/foto_6_big.jpg",
      "https://www.whiskeyprovsechny.cz/images/foto_2_big.jpg",
      "https://www.whiskeyprovsechny.cz/images/foto_7_big.jpg",
      "https://www.whiskeyprovsechny.cz/images/foto_4_big.jpg",
    ],
    openHours: OpenHours(days: [
      Day(name: "Saturday", from: "5PM", to: "12AM"),
      Day(name: "Sunday", from: "5PM", to: "12AM"),
      Day(name: "Monday", from: "5PM", to: "12AM"),
      Day(name: "Tuesday", from: "5PM", to: "12AM"),
      Day(name: "Wednesday", from: "5PM", to: "12AM"),
      Day(name: "Thursday", from: "5PM", to: "12AM"),
      Day(name: "Friday", from: "5PM", to: "12AM"),
    ]),
    localtion: Location(latitude: 20.0, longitude: 50.0),
    mobileNumber: "+420 775 018 444",
    email: "whiskeybar@turbomost.cz",
    social: Social(
      facebook: "https://www.facebook.com/whiskey.bar.kteryneexistuje/",
      instagram: "https://www.instagram.com/whiskey_bar_kteryneexistuje/",
      tripadvisor:
          "https://www.tripadvisor.com/Restaurant_Review-g274714-d14096454-Reviews-Whiskey_Bar_ktery_neexistuje-Brno_South_Moravian_Region_Moravia.html?m=19905",
    ),
  )
];
