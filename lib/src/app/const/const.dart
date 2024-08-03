import 'package:flutter/material.dart';
import 'package:untitled/src/app/model/cus_icon.dart';

late Size mq;

List<CusIcon> popularEvents = [
  CusIcon("All", Icon(Icons.category)),
  CusIcon("Sports", Icon(Icons.sports_baseball)),
  CusIcon("Community", Icon(Icons.group_rounded)),
  CusIcon("Tech", Icon(Icons.laptop_mac_outlined)),
  CusIcon("Festival", Icon(Icons.festival_outlined)),
  CusIcon("Art", Icon(Icons.format_paint)),
  CusIcon("Exhibition", Icon(Icons.museum)),
];

List<CusIcon> bottomBar = [
  CusIcon("Home", Icon(Icons.home)),
  CusIcon("Events", Icon(Icons.calendar_month)),
  CusIcon("Saves", Icon(Icons.bookmark)),
  CusIcon("Setting", Icon(Icons.settings)),
];
