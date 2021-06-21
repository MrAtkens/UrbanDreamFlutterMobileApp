import 'package:urbandreamuser/models/map_marker_entity.dart';

mapMarkerEntityFromJson(MapMarkerEntity data, Map<String, dynamic> json) {
	if (json['state'] != null) {
		data.state = json['state'] is String
				? int.tryParse(json['state'])
				: json['state'].toInt();
	}
	if (json['report'] != null) {
		data.report = json['report'];
	}
	if (json['acceptedModeratorId'] != null) {
		data.acceptedModeratorId = json['acceptedModeratorId'].toString();
	}
	if (json['acceptedModeratorAnswer'] != null) {
		data.acceptedModeratorAnswer = json['acceptedModeratorAnswer'].toString();
	}
	if (json['moderatedModeratorId'] != null) {
		data.moderatedModeratorId = json['moderatedModeratorId'].toString();
	}
	if (json['moderatedModeratorAnswer'] != null) {
		data.moderatedModeratorAnswer = json['moderatedModeratorAnswer'];
	}
	if (json['tags'] != null) {
		data.tags = (json['tags'] as List).map((v) => MapMarkerTags().fromJson(v)).toList();
	}
	if (json['images'] != null) {
		data.images = (json['images'] as List).map((v) => MapMarkerImages().fromJson(v)).toList();
	}
	if (json['brigadeId'] != null) {
		data.brigadeId = json['brigadeId'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude'] is String
				? double.tryParse(json['longitude'])
				: json['longitude'].toDouble();
	}
	if (json['latitude'] != null) {
		data.latitude = json['latitude'] is String
				? double.tryParse(json['latitude'])
				: json['latitude'].toDouble();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['countOfWatchings'] != null) {
		data.countOfWatchings = json['countOfWatchings'] is String
				? int.tryParse(json['countOfWatchings'])
				: json['countOfWatchings'].toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'].toString();
	}
	if (json['raiting'] != null) {
		data.raiting = json['raiting'] is String
				? int.tryParse(json['raiting'])
				: json['raiting'].toInt();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['creationDate'] != null) {
		data.creationDate = json['creationDate'].toString();
	}
	return data;
}

Map<String, dynamic> mapMarkerEntityToJson(MapMarkerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['state'] = entity.state;
	data['report'] = entity.report;
	data['acceptedModeratorId'] = entity.acceptedModeratorId;
	data['acceptedModeratorAnswer'] = entity.acceptedModeratorAnswer;
	data['moderatedModeratorId'] = entity.moderatedModeratorId;
	data['moderatedModeratorAnswer'] = entity.moderatedModeratorAnswer;
	data['tags'] =  entity.tags.map((v) => v.toJson()).toList();
	data['images'] =  entity.images.map((v) => v.toJson()).toList();
	data['brigadeId'] = entity.brigadeId;
	data['title'] = entity.title;
	data['longitude'] = entity.longitude;
	data['latitude'] = entity.latitude;
	data['description'] = entity.description;
	data['countOfWatchings'] = entity.countOfWatchings;
	data['userId'] = entity.userId;
	data['raiting'] = entity.raiting;
	data['id'] = entity.id;
	data['creationDate'] = entity.creationDate;
	return data;
}

mapMarkerTagsFromJson(MapMarkerTags data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['pins'] != null) {
		data.pins = (json['pins'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['creationDate'] != null) {
		data.creationDate = json['creationDate'].toString();
	}
	return data;
}

Map<String, dynamic> mapMarkerTagsToJson(MapMarkerTags entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['pins'] = entity.pins;
	data['id'] = entity.id;
	data['creationDate'] = entity.creationDate;
	return data;
}

mapMarkerImagesFromJson(MapMarkerImages data, Map<String, dynamic> json) {
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['creationDate'] != null) {
		data.creationDate = json['creationDate'].toString();
	}
	return data;
}

Map<String, dynamic> mapMarkerImagesToJson(MapMarkerImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['url'] = entity.url;
	data['id'] = entity.id;
	data['creationDate'] = entity.creationDate;
	return data;
}