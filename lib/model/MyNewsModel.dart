// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

class MyNewsModel {
  String? category;
  List<Data>? data;
  bool? success;

  MyNewsModel({this.category, this.data, this.success});

  MyNewsModel.fromJson(Map<String, dynamic> json) {
    category = json['category'] ?? "";
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? author;
  String? content;
  String? date;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

  Data({this.author, this.content, this.date, this.imageUrl, this.readMoreUrl, this.time, this.title, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    author = json['author'] ?? "";
    content = json['content'] ?? "";
    date = json['date'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
    readMoreUrl = json['readMoreUrl'] ?? "";
    time = json['time'] ?? "";
    title = json['title'] ?? "";
    url = json['url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['content'] = this.content;
    data['date'] = this.date;
    data['imageUrl'] = this.imageUrl;
    data['readMoreUrl'] = this.readMoreUrl;
    data['time'] = this.time;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
