import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:wangyiyun/screens/playlist/play_list_screen.dart';
import 'package:wangyiyun/widgets/play_list_cover.dart';
import 'package:wangyiyun/utils/numbers_convert.dart';

class HomeRecommend extends StatelessWidget {
  final List recommendList;

  HomeRecommend(this.recommendList);
=======
import 'package:neteast_cloud_music/screens/playlist/play_list_screen.dart';
import 'package:neteast_cloud_music/utils/routes/navigator_util.dart';
import 'package:neteast_cloud_music/widgets/play_list_cover.dart';
import 'package:neteast_cloud_music/utils/numbers_convert.dart';

class HomeRecommend extends StatelessWidget {
  final List recommendList;
  final ScrollController controller;
  final ScrollPhysics physics;

  HomeRecommend(
      {@required this.recommendList,
      @required this.controller,
      @required this.physics});
>>>>>>> new

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(280.0),
      child: ListView.builder(
<<<<<<< HEAD
        padding: EdgeInsets.only(top: 10.0, left: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PlayListScreen(520, recommendList[index].id)));
            },
=======
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40.0)),
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: physics,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => NavigatorUtil.goPlayListDetailPage(context,
                expandedHeight: 520, id: recommendList[index].id),
>>>>>>> new
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Column(children: <Widget>[
                PlayListCoverWidget(recommendList[index].picUrl,
                    playCount: NumberUtils.amountConversion(
                        recommendList[index].playcount)),
                SizedBox(height: 5.0),
                Container(
                    width: ScreenUtil().setWidth(200.0),
                    child: Text(recommendList[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: ScreenUtil().setSp(23.0))))
              ]),
            ),
          );
        },
      ),
    );
  }
}
