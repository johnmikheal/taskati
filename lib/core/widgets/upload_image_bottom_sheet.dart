import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/widgets/main_button.dart';

showUploadButtomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainButton(
                title: 'Upload From Camera',
                onPressed: () {
                  uploadImageFromCamera();
                },
              ),
              SizedBox(height: 10),

              MainButton(
                title: 'Upload From Gallery',
                onPressed: () {
                  uploadImageFromGallery();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

uploadImageFromCamera() async{
  var imagePicker = ImagePicker();
  var pickedImage =await imagePicker.pickImage(source: ImageSource.camera);
  if(pickedImage!= null){
    
  }
}

uploadImageFromGallery() {
  var imagePicker = ImagePicker();
  imagePicker.pickImage(source: ImageSource.gallery);
}
