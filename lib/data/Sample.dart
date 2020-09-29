/*
 * @Descripttion: 
 * @version: 
 * @Author: Yimi81
 * @Date: 2020-09-29 10:06:57
 * @LastEditors: Yimi81
 * @LastEditTime: 2020-09-29 14:06:15
 */
import 'package:flutternote/models/Collocation.dart';
import 'package:flutternote/models/Post.dart';
import 'package:flutternote/models/User.dart';

class Sample {
  static User mohammad = new User(
      name: "Mohammad Rahmani",
      username: "@ygf",
      followers: 400,
      following: 190,
      profilePicture: "images/mohammad.jpg",
      collocation: [
        new Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photographt"],
            thumbnail: "images/one.jpg",
            posts: [
              Post(
                  location: "Kabul,Afghanistan",
                  dateAgo: "3 min ago",
                  photos: [
                    'images/one.jpg',
                    'images/two.jpg',
                    'images/three.jpg',
                  ]),
              Post(
                  location: "Herat,Afghanistan",
                  dateAgo: "2 weeks ago",
                  photos: [
                    'images/six.jpg',
                    'images/eight.jpg',
                    'images/two.jpg',
                  ]),
            ]),
        new Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photographt"],
            thumbnail: "images/five.jpg",
            posts: [
              Post(
                  location: "Kabul,Afghanistan",
                  dateAgo: "3 min ago",
                  photos: [
                    'images/one.jpg',
                    'images/two.jpg',
                    'images/three.jpg',
                  ]),
              Post(
                  location: "Herat,Afghanistan",
                  dateAgo: "2 weeks ago",
                  photos: [
                    'images/six.jpg',
                    'images/eight.jpg',
                    'images/two.jpg',
                  ]),
            ]),
      ]);

  static User yasir = new User(
      name: "Mohammad Rahmani",
      username: "@yimi81",
      followers: 400,
      following: 190,
      profilePicture: "images/yasir.jpg",
      collocation: [
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photographt"],
            thumbnail: "images/two.jpg",
            posts: [
              Post(
                  location: "Kabul,Afghanistan",
                  dateAgo: "3 min ago",
                  photos: [
                    'images/five.jpg',
                    'images/six.jpg',
                    'images/seven.jpg',
                  ]),
              Post(
                  location: "Herat,Afghanistan",
                  dateAgo: "2 weeks ago",
                  photos: [
                    'images/six.jpg',
                    'images/eight.jpg',
                    'images/two.jpg',
                  ]),
            ])
      ]);

  static Post postOne = Post(
      user: mohammad,
      location: "China, Ninbo",
      dateAgo: "3 min ago",
      photos: [
        'images/one.jpg',
        'images/two.jpg',
        'images/three.jpg'
      ],
      relatedPhotos: [
        'images/four.jpg',
        'images/five.jpg',
        'images/six.jpg',
        'images/seven.jpg',
        'images/eight.jpg',
      ]);

  static Post postTwo = Post(
      user: yasir,
      location: "Kabul, Afghanistan",
      dateAgo: "3 weeks ago",
      photos: [
        'images/four.jpg',
        'images/five.jpg',
        'images/six.jpg'
      ],
      relatedPhotos: [
        'images/one.jpg',
        'images/two.jpg',
        'images/three.jpg',
        'images/seven.jpg',
        'images/eight.jpg',
      ]);
}
