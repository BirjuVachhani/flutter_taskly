// Author: Birju Vachhani
// Created Date: March 18, 2021

class Project {
  int id;
  int order;
  int color;
  String name;
  int commentCount;
  bool shared;
  bool favorite;
  int syncId;
  String url;

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    order = json['order'] ?? 0;
    color = json['color'];
    name = json['name'];
    commentCount = json['commentCount'] ?? 0;
    shared = json['shared'] ?? false;
    favorite = json['favorite'] ?? false;
    syncId = json['syncId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "color": color,
        "name": name,
        "comment_count": commentCount,
        "shared": shared,
        "favorite": favorite,
        "sync_id": syncId,
        "url": url,
      };
}
