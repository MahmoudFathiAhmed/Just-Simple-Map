import 'package:camera/camera.dart';
import 'package:locations_work/modules/screen_navigate/models/my_model.dart';

class LatLonFromMapScreenArgs {
  final double lat;
  final double long;

  LatLonFromMapScreenArgs(this.lat, this.long);
}

class ImagePreviewScreenArgs {
  final XFile file;

  ImagePreviewScreenArgs(this.file);
}

class MyArgument {
  final MyModel? myModel;

  MyArgument({this.myModel});
}

// class FirebaseNotificationsScreenArgs {
//   final String body;

//   FirebaseNotificationsScreenArgs({required this.body});
// }
