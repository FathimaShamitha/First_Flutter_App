import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends ChangeNotifier{

  File? image;

  uplaodImage()async{
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(img!.path);
    notifyListeners();
  }
}