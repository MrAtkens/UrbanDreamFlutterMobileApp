class MapPin {
  late int state;
  late Null report;
  late String acceptedModeratorId;
  late String acceptedModeratorAnswer;
  late String moderatedModeratorId;
  late Null moderatedModeratorAnswer;
  late List<Tags> tags;
  late List<Images> images;
  late String brigadeId;
  late String title;
  late double longitude;
  late double latitude;
  late String description;
  late int countOfWatchings;
  late String userId;
  late double raiting;
  late String id;
  late String creationDate;

  MapPin.empty();

  MapPin(
      {required this.state,
        this.report,
        required this.acceptedModeratorId,
        required this.acceptedModeratorAnswer,
        required this.moderatedModeratorId,
        this.moderatedModeratorAnswer,
        required this.tags,
        required this.images,
        required this.brigadeId,
        required this.title,
        required this.longitude,
        required this.latitude,
        required this.description,
        required this.countOfWatchings,
        required this.userId,
        required this.raiting,
        required this.id,
        required this.creationDate});

  MapPin.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    report = json['report'];
    acceptedModeratorId = json['acceptedModeratorId'];
    acceptedModeratorAnswer = json['acceptedModeratorAnswer'];
    moderatedModeratorId = json['moderatedModeratorId'];
    moderatedModeratorAnswer = json['moderatedModeratorAnswer'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    brigadeId = json['brigadeId'];
    title = json['title'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    description = json['description'];
    countOfWatchings = json['countOfWatchings'];
    userId = json['userId'];
    raiting = json['raiting'];
    id = json['id'];
    creationDate = json['creationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['report'] = this.report;
    data['acceptedModeratorId'] = this.acceptedModeratorId;
    data['acceptedModeratorAnswer'] = this.acceptedModeratorAnswer;
    data['moderatedModeratorId'] = this.moderatedModeratorId;
    data['moderatedModeratorAnswer'] = this.moderatedModeratorAnswer;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['brigadeId'] = this.brigadeId;
    data['title'] = this.title;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['description'] = this.description;
    data['countOfWatchings'] = this.countOfWatchings;
    data['userId'] = this.userId;
    data['raiting'] = this.raiting;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    return data;
  }
}

class Tags {
  late String title;
  late List<Null> pins;
  late String id;
  late String creationDate;

  Tags({required this.title, required this.pins, required this.id, required this.creationDate});

  Tags.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['pins'] != null) {
      pins = <Null>[];
      json['pins'].forEach((v) {
        pins.add(null);
      });
    }
    id = json['id'];
    creationDate = json['creationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    return data;
  }
}

class Images {
  late String url;
  late String id;
  late String creationDate;

  Images({required this.url, required this.id, required this.creationDate});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    creationDate = json['creationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    return data;
  }
}