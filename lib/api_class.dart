class NewsFeed {
  String? status;
  List<Data>? data;

  NewsFeed({this.status, this.data});

  NewsFeed.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      print('-----running fromjson');
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> datas = <String, dynamic>{};
    datas['status'] = status;
    if (data != null) {
      datas['data'] = data!.map((e) => e.toJson()).toList();
    }
    print('-------running  toJson');
    return datas;
  }
}

class Data {
  String? source;
  String? title;
  String? link;
  String? description;
  String? pubDate;

  Data({this.source, this.title, this.link, this.description, this.pubDate});

  Data.fromJson(Map<String, dynamic> json) {
    print('-------fromjson');
    source = json['source'];
    title = json['title'];
    link= json['link'];
    description = json['description'];
    pubDate = json['pubDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> datas = <String, dynamic>{};
    datas['source'] = source;
    datas['title'] = title;
    datas['description'] = description;
    datas['pubDate'] = pubDate;
    return datas;
  }
}
