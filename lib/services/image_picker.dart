import 'dart:io';

//import 'dart:html';
//import 'package:path/path.dart' as p;
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final imagePicker = ImagePicker();
  // Returns a [File] object pointing to the image that was picked.
  Future<File> pickImage({required ImageSource source}) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    return File(pickedFile!.path);
  }
}
