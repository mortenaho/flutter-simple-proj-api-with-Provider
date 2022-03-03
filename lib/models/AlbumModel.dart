class Album{
  int albumId=0;
  int id=0;
  String title="";
  String url="";
  String thumbnailUrl="";

  Album({this.albumId=0, this.id=0, this.title="", this.url="", this.thumbnailUrl=""});


  factory Album.fromMap(dynamic map) {
    if (null == map) return Album();
    return Album(
      albumId:int.parse(map['albumId'].toString()),
      id:int.parse(map['id'].toString()),
      title: map['title'].toString(),
      url: map['url'].toString(),
      thumbnailUrl: map['thumbnailUrl'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}