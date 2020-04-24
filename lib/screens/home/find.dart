import 'dart:io';
import 'package:async/async.dart';
<<<<<<< HEAD
=======
import 'package:color_thief_flutter/color_thief_flutter.dart';
import 'package:common_utils/common_utils.dart';
>>>>>>> new

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
<<<<<<< HEAD
import 'package:wangyiyun/model/banner_model.dart';
import 'package:wangyiyun/model/home_rank_model.dart';
import 'package:wangyiyun/model/newest_album_model.dart';
import 'package:wangyiyun/model/rank_list_model.dart';
import 'package:wangyiyun/model/recommend_list_model.dart';
import 'package:wangyiyun/model/recommend_song_list_model.dart';
import 'package:wangyiyun/screens/daily_recommend/daily_recommend_screen.dart';
import 'package:wangyiyun/screens/home/title_header.dart';
import 'package:wangyiyun/screens/playlist/play_list_ground_screen.dart';
import 'package:wangyiyun/store/index.dart';
import 'package:wangyiyun/store/model/tag_model.dart';
import 'package:wangyiyun/widgets/play_list_cover.dart';
import 'package:wangyiyun/utils/config.dart';
import 'package:wangyiyun/utils/custom_scroll_physic.dart';
import 'package:wangyiyun/api/CommonService.dart';
=======
import 'package:neteast_cloud_music/model/banner_model.dart';
import 'package:neteast_cloud_music/model/newest_album_model.dart';
import 'package:neteast_cloud_music/model/rank.dart';
import 'package:neteast_cloud_music/model/rank_list_model.dart';
import 'package:neteast_cloud_music/model/recommend_list_model.dart';
import 'package:neteast_cloud_music/model/recommend_song_list_model.dart';

import 'package:neteast_cloud_music/screens/home/title_header.dart';
import 'package:neteast_cloud_music/screens/playlist/play_list_ground_screen.dart';

import 'package:neteast_cloud_music/store/index.dart';
import 'package:neteast_cloud_music/store/model/tag_model.dart';
import 'package:neteast_cloud_music/utils/config.dart';

import 'package:neteast_cloud_music/api/CommonService.dart';
import 'package:neteast_cloud_music/utils/routes/navigator_util.dart';
import 'package:neteast_cloud_music/widgets/custom_scroll_physic.dart';
>>>>>>> new

import 'home_banner.dart';
import 'home_rank.dart';
import 'home_recommend.dart';
import 'home_music_list.dart';

class Find extends StatefulWidget {
  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> with AutomaticKeepAliveClientMixin {
  List _type = Config.type;
  List _rankType = Config.rankType;
  int _code = Config.SUCCESS_CODE;

  DateTime now = new DateTime.now();
  AsyncMemoizer _memoizer = AsyncMemoizer();

<<<<<<< HEAD
  // 推荐controller
  ScrollController _controller = new ScrollController();
  // 新碟controller
  ScrollController _newController = new ScrollController();
  // 排行榜controller
  ScrollController _rankController = new ScrollController();

  ScrollPhysics _physics;
=======
  // 歌单推荐controller
  ScrollController _discController = new ScrollController();
  ScrollPhysics _discPhysics;
  // 歌曲推荐controller
  ScrollController _controller = new ScrollController();
  ScrollPhysics _physics;
  // 新碟controller
  ScrollController _newController = new ScrollController();
  ScrollPhysics _newPhysics;
  // 排行榜controller
  ScrollController _rankController = new ScrollController();
  ScrollPhysics _rankPhysics;
>>>>>>> new

  Future _initData;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _initData = _load();
    super.initState();

<<<<<<< HEAD
    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension = _controller.position.maxScrollExtent / 2;
          _physics = CustomScrollPhysics(itemDimension: dimension);
=======
    _discController.addListener(() {
      if (_discController.position.haveDimensions && _discPhysics == null) {
        setState(() {
          double itemWidth = ScreenUtil().setWidth(200.0) + 10;
          _discPhysics = PagingScrollPhysics(
              itemDimension: itemWidth,
              maxSize: itemWidth * (6 - 1),
              leadingSpacing: 0.0,
              parent: AlwaysScrollableScrollPhysics());
        });
      }
    });

    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension = _controller.position.maxScrollExtent / (3 - 1);
          _physics = PagingScrollPhysics(
              itemDimension: dimension,
              maxSize: _controller.position.maxScrollExtent,
              leadingSpacing: 0.0);
>>>>>>> new
        });
      }
    });

    _newController.addListener(() {
<<<<<<< HEAD
      if (_newController.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension = _newController.position.maxScrollExtent;
          _physics = CustomScrollPhysics(itemDimension: dimension);
=======
      if (_newController.position.haveDimensions && _newPhysics == null) {
        setState(() {
          var dimension = _newController.position.maxScrollExtent / (2 - 1);
          _newPhysics = PagingScrollPhysics(
              itemDimension: dimension,
              maxSize: _newController.position.maxScrollExtent,
              leadingSpacing: 0.0);
>>>>>>> new
        });
      }
    });

    _rankController.addListener(() {
<<<<<<< HEAD
      if (_rankController.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension = _rankController.position.maxScrollExtent / 4;
          _physics = CustomScrollPhysics(itemDimension: dimension);
=======
      if (_rankController.position.haveDimensions && _rankPhysics == null) {
        setState(() {
          var dimension = _rankController.position.maxScrollExtent / (5 - 1);
          _rankPhysics = PagingScrollPhysics(
              itemDimension: dimension,
              maxSize: _rankController.position.maxScrollExtent,
              leadingSpacing: 0.0);
>>>>>>> new
        });
      }
    });
  }

  @override
  void dispose() {
<<<<<<< HEAD
=======
    _discController.dispose();
>>>>>>> new
    _controller.dispose();
    _newController.dispose();
    _rankController.dispose();
    super.dispose();
  }

  Future _initBanner() {
    int _type;
    if (Platform.isAndroid) {
      _type = 1;
    } else if (Platform.isIOS) {
      _type = 2;
    }
    return CommmonService().getBanner(_type).then((res) {
      if (res.statusCode == 200) {
        BannersModel _bean = BannersModel.fromJson(res.data);
        if (_bean.code == _code) {
          return _bean.banners;
<<<<<<< HEAD
          // setState(() {
          //   _bannerList = banners;
          // });
=======
>>>>>>> new
        }
      }
    });
  }

  Future _initRecommend() {
    return CommmonService().getRecommendList().then((res) {
      if (res.statusCode == 200) {
        RecommendListModel _bean = RecommendListModel.fromJson(res.data);
        if (_bean.code == _code) {
          return _bean.recommend;
<<<<<<< HEAD
          // setState(() {
          //   _recommendList = recommendList;
          // });
=======
>>>>>>> new
        }
      }
    });
  }

  Future _initRecommendSong() {
    return CommmonService().getRecommendSongList().then((res) {
      if (res.statusCode == 200) {
        RecommendSongListModel _bean =
            RecommendSongListModel.fromJson(res.data);
        if (_bean.code == _code) {
<<<<<<< HEAD
          _bean.recommend
            ..shuffle()
            ..removeRange(9, _bean.recommend.length);
          List recommendSongList = _bean.recommend;
=======
          List recommendSongList = _bean.recommend
            ..shuffle()
            ..removeWhere((song) => song.status == -200 || song.fee == 1)
            ..removeRange(9, _bean.recommend.length);
>>>>>>> new
          String reason = _bean.recommend.first.reason;
          var filter =
              _bean.recommend.takeWhile((item) => item.reason == reason);
          if (filter.length > 6) {
          } else {
            return recommendSongList;
<<<<<<< HEAD
            // setState(() {
            //   _recommendSongList = recommendSongList;
            // });
=======
>>>>>>> new
          }
        }
      }
    });
  }

  Future _initNewestAlbum() {
    return CommmonService().getNewestAlbum().then((res) {
      if (res.statusCode == 200) {
        NewestAlbumModel _bean = NewestAlbumModel.fromJson(res.data);
        if (_bean.code == _code) {
          _bean.albums
            ..shuffle()
            ..removeRange(6, _bean.albums.length);
          return _bean.albums;
        }
      }
    });
  }

  Future _initRankList() async {
<<<<<<< HEAD
    List _list = new List();
=======
    List<Rank> _list = new List();
>>>>>>> new
    for (var i in _rankType) {
      await CommmonService().getRank(i["type"]).then((res) {
        if (res.statusCode == 200) {
          RankListModel _bean = RankListModel.fromJson(res.data);
          if (_bean.code == _code) {
<<<<<<< HEAD
            _bean.playlist.tracks.removeRange(3, _bean.playlist.tracks.length);
            var rank = {
              "title": "${i["title"]}",
              "content": _bean.playlist.tracks
            };
            _list.add(rank);
=======
            List<Tracks> tracks = _bean.playlist.tracks.sublist(0, 3);
            getColorFromUrl(tracks.first.al.picUrl).then((color) {
              return Color.fromRGBO(color[0], color[1], color[2], 1);
            }).then((color) {
              Rank _rank = Rank(
                  title: "${i["title"]}",
                  content: _bean.playlist.tracks.sublist(0, 3),
                  bgColor: color);

              _list.add(_rank);
            });
>>>>>>> new
          }
        }
      });
    }
<<<<<<< HEAD
=======

>>>>>>> new
    return _list;
  }

  _load() {
    return _memoizer.runOnce(() async {
      return Future.wait([
        _initBanner(),
        _initRecommend(),
        _initRecommendSong(),
        _initNewestAlbum(),
        _initRankList()
      ]);
    });
  }

  Widget playType() {
    return Store.connect<TagModel>(builder: (context, model, child) {
      return Container(
        height: ScreenUtil().setHeight(150.0),
<<<<<<< HEAD
        padding: EdgeInsets.symmetric(horizontal: 10.0),
=======
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40.0)),
>>>>>>> new
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _type.map((item) {
              return Column(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    switch (item["index"]) {
                      case 0:
<<<<<<< HEAD
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DailyRecommendScreen()));
=======
                        NavigatorUtil.goDailyPage(context);
>>>>>>> new
                        break;
                      case 1:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PlayListGroundScreen(tagModel: model)));
                        break;
<<<<<<< HEAD
=======
                      case 2:
                        NavigatorUtil.goRankPage(context);
                        break;
>>>>>>> new
                      default:
                    }
                  },
                  child: CircleAvatar(
                      radius: 22.0,
                      backgroundColor: Color(0xffff1916),
                      child:
                          Stack(alignment: Alignment.center, children: <Widget>[
                        Image.asset(item["image"]),
                        item["index"] == 0
                            ? Align(
                                alignment: FractionalOffset(0.5, 0.55),
                                child: Text(
                                  '${now.day}',
                                  style: TextStyle(
                                      color: Color(0xffff1916),
                                      fontSize: ScreenUtil().setSp(25.0),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container()
                      ])),
                ),
                SizedBox(height: 5.0),
                Text(item["text"],
                    style: TextStyle(fontSize: ScreenUtil().setSp(20.0)))
              ]);
            }).toList()),
      );
    });
  }

  Widget home(List bannerList, List recommendList, List recommendSongList,
      List albumList, List homeRankList, double ratio) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          scrollDirection: Axis.vertical,
<<<<<<< HEAD
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            SizedBox(height: ScreenUtil().setHeight(60.0)),
=======
          padding: EdgeInsets.symmetric(
              // horizontal: ScreenUtil().setWidth(40.0),
              vertical: ScreenUtil().setHeight(20.0)),
          children: <Widget>[
            SizedBox(
                height: ScreenUtil().setHeight(60.0) +
                    MediaQuery.of(context).padding.top),
>>>>>>> new
            HomeBanner(bannerList), //banner
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            playType(), // 首页按钮
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            TitleHeader('推荐歌单', '为你精挑细选', 1),
<<<<<<< HEAD
            HomeRecommend(recommendList), // 发现页面推荐歌单
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            TitleHeader('风格推荐', '根据你喜欢的歌曲推荐', 0),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            HomeMusicList(_controller, _physics, recommendSongList, ratio),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            TitleHeader('${now.month}月${now.day}日', '新碟', 1),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            HomeMusicList(_newController, _physics, albumList, ratio,
=======
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            HomeRecommend(
              recommendList: recommendList,
              controller: _discController,
              physics: _discPhysics,
            ), // 发现页面推荐歌单
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            TitleHeader('风格推荐', '根据你喜欢的歌曲推荐', 0),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            HomeMusicList(
                controller: _controller,
                physics: _physics,
                list: recommendSongList,
                ratio: ratio),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            TitleHeader('${now.month}月${now.day}日', '新碟', 1),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            HomeMusicList(
                controller: _newController,
                physics: _newPhysics,
                list: albumList,
                ratio: ratio,
>>>>>>> new
                isAlbum: true),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            TitleHeader('排行榜', '热歌风向标', 1),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
<<<<<<< HEAD
            HomeRank(_rankController, _physics, homeRankList, ratio),
=======
            HomeRank(
                controller: _rankController,
                physics: _rankPhysics,
                list: homeRankList,
                ratio: ratio),
>>>>>>> new
            SizedBox(
                height: ScreenUtil().setHeight(150.0),
                child: Center(
                    child: Text('到底啦~', style: TextStyle(color: Colors.grey)))),
<<<<<<< HEAD
            SizedBox(height: ScreenUtil().setHeight(30.0))
=======
            SizedBox(height: ScreenUtil().setHeight(20.0))
>>>>>>> new
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double ratio = ScreenUtil().setWidth(100.0) /
        (MediaQuery.of(context).size.width - 60); // gridview的宽高比

    return FutureBuilder(
      future: _initData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
                child: SpinKitChasingDots(
                    color: Theme.of(context).primaryColor, size: 30.0));
          case ConnectionState.done:
            List bannerList = snapshot.data[0];
            List recommendList = snapshot.data[1];
            List recommendSongList = snapshot.data[2];
            List albumList = snapshot.data[3];
            List homeRankList = snapshot.data[4];
<<<<<<< HEAD
=======

>>>>>>> new
            return home(bannerList, recommendList, recommendSongList, albumList,
                homeRankList, ratio);
          default:
            return null;
        }
      },
    );
  }
}
