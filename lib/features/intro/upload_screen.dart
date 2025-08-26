import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/dialog.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/home/page/home_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

String? path;
var nameController = TextEditingController();

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path != null && nameController.text.isNotEmpty) {
                LocalHelper.cachData(LocalHelper.kIsUpload, true);
                LocalHelper.cachData(LocalHelper.kName, nameController.text);
                LocalHelper.cachData(LocalHelper.kImage, path);
                pushReplacement(context, HomeScreen());
              } else if (path == null && nameController.text.isNotEmpty) {
                showErrorDialog(context, 'please select an image');
              } else if (path != null && nameController.text.isEmpty) {
                showErrorDialog(context, 'please enter your name');
              } else {
                showErrorDialog(
                  context,
                  'please select an image and enter your name',
                );
              }
            },
            child: Text(
              'Done',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
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
                                width: double.infinity,
                                title: 'Upload From Camera',
                                onPressed: () {
                                  uploadImageFromCamera(true);
                                },
                              ),
                              SizedBox(height: 10),

                              MainButton(
                                width: double.infinity,

                                title: 'Upload From Gallery',
                                onPressed: () {
                                  uploadImageFromCamera(false);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Stack(
                  children: [
                    path != null
                        ? ClipOval(
                            child: Image.file(
                              File(path ?? ''),
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          )
                        : CircleAvatar(
                            radius: 70,
                            backgroundColor: AppColors.primaryColor,
                            backgroundImage: AssetImage(AppImages.user),
                          ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),

                    //
                  ],
                ),
              ),
              Gap(20),
              Divider(),
              Gap(20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2_sharp),
                  suffixIcon: Icon(Icons.check),
                  // label: Text('Email'),
                  hint: Text('Enter your name'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadImageFromCamera(bool isCamera) async {
    var imagePicker = ImagePicker();
    var pickedImage = await imagePicker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
      Navigator.pop(context);
    }
  }
}
