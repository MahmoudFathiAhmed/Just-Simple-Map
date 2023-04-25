import 'dart:io';

import 'package:locations_work/modules/screen_navigate/models/my_model.dart';

class LatLonFromMapScreenArgs {
  final double lat;
  final double long;

  LatLonFromMapScreenArgs(this.lat, this.long);
}

class PicturePreviewScreenArgs {
  File? file;

  PicturePreviewScreenArgs({this.file});
}

class MyArgument {
  final MyModel? myModel;

  MyArgument({this.myModel});
}
