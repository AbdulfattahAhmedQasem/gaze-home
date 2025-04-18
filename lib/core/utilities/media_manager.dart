// import 'dart:io';

// import 'package:afzaz/core/helpers/app_functions.dart';
// import 'package:image_picker/image_picker.dart';

// class MediaManager {
//   const MediaManager._();

//   static Future<File?> pickImage(ImageSource source) async {
//     try {
//       final picker = ImagePicker();
//       final image = await picker.pickImage(source: source);
//       if (image != null) {
//         return File(image.path);
//       }
//     } on Exception catch (e) {
//       showLog(e.toString());
//     }
//     return null;
//   }
// }
