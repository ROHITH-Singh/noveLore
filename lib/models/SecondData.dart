class SecondData {
  String id;
  String imgthmp;
  String title;
  String author;
  String description;

  SecondData({this.id, this.imgthmp, this.title, this.author,this.description}); //constructor

  SecondData.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        imgthmp = json["imgthmp"],
        title = json["Title"],
        author = json["author"],
        description = json["description"];
}
