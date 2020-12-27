class LengthData {
  String id;
   int chapterslength;

  LengthData({this.id, this.chapterslength}); //constructor

  LengthData.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        chapterslength =json["chapterslength"];
}
