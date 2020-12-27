class FirstData {
  String id;
  String imgthmp;
  String title;
  String author;

  FirstData({this.id, this.imgthmp, this.title, this.author}); //constructor

  FirstData.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        imgthmp = json["imgthmp"],
        title = json["Title"],
        author = json["author"];
}
