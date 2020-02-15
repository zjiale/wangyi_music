import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wangyiyun/utils/my_special_textspan_builder.dart';
import 'package:wangyiyun/widgets/play_list_cover.dart';

class HomeMusicList extends StatefulWidget {
  final ScrollController controller;
  final ScrollPhysics physics;
  final List list;
  final double ratio;
  final bool isAlbum;

  HomeMusicList(this.controller, this.physics, this.list, this.ratio,
      {this.isAlbum = false});
  @override
  _HomeMusicListState createState() => _HomeMusicListState();
}

class _HomeMusicListState extends State<HomeMusicList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300.0),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          controller: widget.controller,
          itemCount: widget.list.length,
          physics: widget.physics,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 3,
              mainAxisSpacing: 5.0,
              //横轴间距
              crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: widget.ratio),
          itemBuilder: (BuildContext context, int index) {
            //Widget Function(BuildContext context, int index)
            return Column(children: <Widget>[
              Row(children: <Widget>[
                PlayListCoverWidget(
                  widget.isAlbum != true
                      ? widget.list[index].album.blurPicUrl
                      : widget.list[index].blurPicUrl,
                  width: 100,
                  isAlbum: widget.isAlbum,
                ),
                SizedBox(width: ScreenUtil().setWidth(10.0)),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      ExtendedText(
                          '${widget.list[index].name} @s- ${widget.list[index].artists.first.name}@',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          specialTextSpanBuilder: MySpecialTextSpanBuilder(),
                          overFlowTextSpan:
                              OverFlowTextSpan(children: <TextSpan>[
                            TextSpan(text: '\u2026  '),
                            TextSpan(
                                text:
                                    "- ${widget.list[index].artists.first.name}",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(20.0),
                                    color: Colors.grey))
                          ])),
                      SizedBox(height: ScreenUtil().setHeight(8.0)),
                      !widget.isAlbum
                          ? Text('${widget.list[index].album.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20.0),
                                  color: Colors.grey))
                          : Container()
                    ])),
                !widget.isAlbum
                    ? Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.play_circle_outline,
                            size: 30.0, color: Theme.of(context).primaryColor),
                      )
                    : Container(
                        width: 30.0, padding: EdgeInsets.only(right: 10.0))
              ])
            ]);
          }),
    );
  }
}
