/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-29 09:58:59
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-29 10:16:09
 */
import 'package:flutternote/models/Post.dart';

class Collocation {
  final String name;
  final String thumbnail;
  final List<String> tags;
  final List<Post> posts;
  Collocation({this.name, this.thumbnail, this.tags, this.posts});
}
