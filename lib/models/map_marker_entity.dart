import 'package:urbandreamuser/generated/json/base/json_convert_content.dart';

class MapMarkerEntity with JsonConvert<MapMarkerEntity> {
	late int state;
	late dynamic report;
	late String acceptedModeratorId;
	late String acceptedModeratorAnswer;
	late String moderatedModeratorId;
	late dynamic moderatedModeratorAnswer;
	late List<MapMarkerTags> tags;
	late List<MapMarkerImages> images;
	late String brigadeId;
	late String title;
	late double longitude;
	late double latitude;
	late String description;
	late int countOfWatchings;
	late String userId;
	late int raiting;
	late String id;
	late String creationDate;
}

class MapMarkerTags with JsonConvert<MapMarkerTags> {
	late String title;
	late List<dynamic> pins;
	late String id;
	late String creationDate;
}

class MapMarkerImages with JsonConvert<MapMarkerImages> {
	late String url;
	late String id;
	late String creationDate;
}
