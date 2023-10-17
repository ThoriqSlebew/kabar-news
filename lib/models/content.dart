class ContentModel {
  String name;
  String image;
  String title;
  int time;

  ContentModel(
      {required this.name,
      required this.image,
      required this.title,
      required this.time});
}

final List<ContentModel> content = [
  ContentModel(
      name: "Europa ",
      image: "conten1.png",
      title: "Ukraine's President Zelensky to BBC: Blood money being paid...",
      time: 1),
  ContentModel(
      name: "Travel",
      image: "conten2.png",
      title: "Her train broke down. Her phone died.",
      time: 4),
  ContentModel(
      name: "Europe",
      image: "image1.jpg",
      title: "Russian warship: Moskva sinks in Black Sea",
      time: 8),
  ContentModel(
      name: "Money",
      image: "image4.png",
      title: "Wind power produced more electricity than coal and nucle...",
      time: 14),
  ContentModel(
      name: "Life",
      image: "image5.jpg",
      title: "'We keep rising to new challenges:' For churches hit by",
      time: 14),
];