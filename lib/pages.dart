import 'package:flutter/material.dart';
import 'package:flawtrack/views/main/forum.dart';
import 'package:flawtrack/views/main/maps.dart';
import 'package:flawtrack/views/main/volunteer.dart';
import 'package:flawtrack/views/main/profile.dart';


class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapsView();
  }
}

class Forum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ForumView();
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}

class Volunteers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VolunteerView();
  }
}
