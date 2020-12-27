class ContentData {
  String content;

  ContentData({this.content}); //constructor

  ContentData.fromJson(Map<String, dynamic> json) : content = json["content"];
}
