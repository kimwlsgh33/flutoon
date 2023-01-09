// class for make instance
class WebtoonModel {
  final String title, thumb, id;

  // WebtoonModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });

  // named constructor shortcut - recieve json, and make instance
  // define constructor name - diff java
  // use : ( shortcut )
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
