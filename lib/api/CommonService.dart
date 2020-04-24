import 'package:dio/dio.dart';
<<<<<<< HEAD
import 'package:wangyiyun/api/api.dart';
import 'package:wangyiyun/model/newest_album_model.dart';
import 'package:wangyiyun/model/recommend_song_list_model.dart';
import 'package:wangyiyun/utils/config.dart';
import 'package:wangyiyun/model/recommend_list_model.dart';
=======
import 'package:neteast_cloud_music/api/api.dart';
import 'package:neteast_cloud_music/model/newest_album_model.dart';
import 'package:neteast_cloud_music/model/recommend_song_list_model.dart';
import 'package:neteast_cloud_music/utils/config.dart';
import 'package:neteast_cloud_music/model/recommend_list_model.dart';
>>>>>>> new

class CommmonService {
  Future<Response> getBanner(int type) async {
    return await Dio().get("${Api.BANNER}?type=$type", options: _getOptions());
  }

  Future<Response> getRecommendList() async {
    return Dio().get(Api.RECOMMEND_LIST, options: _getOptions());
  }

  Future<Response> getRecommendSongList() async {
    return Dio().get(Api.RECOMMEND_SONG_LIST, options: _getOptions());
  }

  Future<Response> getNewestAlbum() async {
    return Dio().get(Api.NEWEST_ALBUM_LIST, options: _getOptions());
  }

<<<<<<< HEAD
=======
  Future<Response> getRankAbstrack() async {
    return await Dio().get(Api.RANK_LIST_ABSTRACT, options: _getOptions());
  }

>>>>>>> new
  Future<Response> getRank(int type) async {
    return await Dio()
        .get("${Api.RANK_LIST}?idx=$type", options: _getOptions());
  }

  Future<Response> getPlayListsTags() async {
    return Dio().get(Api.PLAY_LIST_TAGS, options: _getOptions());
  }

  Future<Response> getPlayList(int id) async {
    return await Dio().get("${Api.PLAY_LIST}?uid=$id", options: _getOptions());
  }

  Future<Response> getGroundPlayList(
      {int offset = 0, String cat = "全部"}) async {
    return await Dio().get(
        "${Api.TOP_PLAY_LIST}?limit=35&offset=$offset&cat=$cat",
        options: _getOptions());
  }

  Future<Response> getDetailPlayList(int id) async {
    return await Dio()
        .get("${Api.PLAY_LIST_DETAIL}?id=$id", options: _getOptions());
  }

<<<<<<< HEAD
=======
  Future<Response> getSubscribers(int id, {int offset = 0}) async {
    return await Dio().get("${Api.SUBSCRIBERS}?id=$id&limit=20&offset=$offset",
        options: _getOptions());
  }

  Future<Response> getEvent({int lasttime = 0}) async {
    return await Dio()
        .get("${Api.EVENT}?lasttime=$lasttime", options: _getOptions());
  }

  Future<Response> getFollows() async {
    return await Dio()
        .get("${Api.FOLLOWS}?uid=93412043", options: _getOptions());
  }

  Future<Response> getEventComment(String threadId, {int offset = 0}) async {
    return await Dio().get(
        "${Api.EVENT_COMMENT}?threadId=$threadId&offset=$offset",
        options: _getOptions());
  }

  Future<Response> getVideoUrl(String id) async {
    return await Dio().get("${Api.VIDEO_URL}?id=$id", options: _getOptions());
  }

  Future<Response> getSongComment(int id, {int offset = 0}) async {
    return await Dio().get("${Api.SONG_COMMENT}?id=$id&offset=$offset",
        options: _getOptions());
  }

>>>>>>> new
  Options _getOptions() {
    return Options(headers: Config().getHeader());
  }
}
