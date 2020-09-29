/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-29 10:00:16
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-29 10:16:21
 */

import 'package:flutternote/models/User.dart';

class Post {
  final User user;
  final String location;
  final String dateAgo;
  final List<String> photos;
  final List<String> relatedPhotos;
  Post(
      {this.user,
      this.location,
      this.dateAgo,
      this.photos,
      this.relatedPhotos});
}
