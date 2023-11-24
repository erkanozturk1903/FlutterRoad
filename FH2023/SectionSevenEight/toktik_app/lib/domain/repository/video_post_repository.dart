import 'package:toktik_app/domain/entity/video_past.dart';

abstract class VideoPostRepository {
  Future<List<VideoPost>> getTrendingVideosByUser(String userID);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
