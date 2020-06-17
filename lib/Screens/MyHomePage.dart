import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview_task/Models/Data.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Data task;
  List<NetworkImage> imgs = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Response response = await get('https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34');

    String data = response.body;
    setState(() {
      task = Data.fromJson(json.decode(data));
      for (var i in task.img) {
        imgs.add(NetworkImage(i));
      }
    });
  }

  Widget header() {
    return Container(
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            child: Carousel(
              images: imgs,
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.white70,
              indicatorBgPadding: 5.0,
              dotPosition: DotPosition.bottomLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_border,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * .01),
                    Icon(
                      Icons.share,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget sectionOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding:   EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .01),
          child: Text(
            '${task.interest}#',
            style: TextStyle(color: Color(0xffbbc1cb)),
          ),
        ),
        Padding(
          padding:   EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * .01),
          child: Text(
            '${task.title}',
            style: TextStyle(
                color: Color(0xff9fa1b6), fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              '${DateFormat("EEE, MMM d, h:mm a").format(DateTime.parse(task.date))}',
              style: TextStyle(color: Color(0xffbbc1cb)),
            ),
            Icon(Icons.today, size: 30, color: Color(0xffbbc1cb)),
          ],
        ),
        GestureDetector(
          onTap: () {
            MapsLauncher.launchCoordinates(
              double.parse(task.latitude),
              double.parse(task.longitude),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '${task.address}',
                style: TextStyle(color: Color(0xffbbc1cb)),
              ),
              Icon(Icons.pin_drop, size: 30, color: Color(0xffbbc1cb)),
            ],
          ),
        ),
      ],
    );
  }

  Widget sectionTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              '${task.trainerName}',
              style: TextStyle(color: Color(0xffbbc1cb)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            CircleAvatar(
                // there is a problem with trainerImg link so i put an image from google
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvoigdgqzud6UZS5SufGThz4-bt8E7lwMeAy48S7xYvqA-krOv&usqp=CAU')),
          ],
        ),
        Padding(
          padding:   EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * .01),
          child: Text(
            '${task.trainerInfo}',
            style: TextStyle(
                color: Color(0xff9fa1b6), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget sectionThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          'عن الدورة',
          style: TextStyle(color: Color(0xffbbc1cb)),
        ),
        Padding(
          padding:   EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * .01),
          child: Text(
            '${task.occasionDetail}',
            style: TextStyle(
                color: Color(0xff9fa1b6), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget sectionFour() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding:   EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .01),
          child: Text(
            'تكلفه الدورة',
            style: TextStyle(color: Color(0xffbbc1cb)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'SAR ${task.price}',
              style: TextStyle(color: Color(0xffbbc1cb)),
            ),
            Text(
              'الحجز العادى',
              style: TextStyle(color: Color(0xffbbc1cb)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'SAR ${task.price}',
              style: TextStyle(color: Color(0xffbbc1cb)),
            ),
            Text(
              'الحجز المميز',
              style: TextStyle(color: Color(0xffbbc1cb)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'SAR ${task.price}',
              style: TextStyle(color: Color(0xffbbc1cb)),
            ),
            Text(
              'الحجز السريع',
              style: TextStyle(color: Color(0xffbbc1cb)),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: task?.interest == null
            ? SpinKitCircle(
                color: Colors.black,
                size: 100.0,
              )
            : ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      imgs.length == 0 ? Container() : header(),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * .03),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              sectionOne(),
                              Divider(),
                              sectionTwo(),
                              Divider(),
                              sectionThree(),
                              Divider(),
                              sectionFour(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * .01),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(color: Colors.deepPurple),
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'قم بالحجز الان',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
