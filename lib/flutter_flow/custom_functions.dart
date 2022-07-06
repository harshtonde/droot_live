import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String platformIcon(String platform) {
  if (platform == 'INSTAGRAM') {
    return 'https://www.clipartmax.com/png/middle/169-1696957_instagram-icon-instagram-icon-svg-white.png';
  } else if (platform == 'YOUTUBE') {
    return 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/YouTube_dark_icon_%282017%29.svg/1024px-YouTube_dark_icon_%282017%29.svg.png';
  }
}
