import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({
    super.key,
    required this.onImagePick,
    this.image,
  });

  final Function(XFile? image) onImagePick;
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );
        if (!image.isBlank!) {
          onImagePick(image);
        } else {
          log('Image not selected');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xffF5F5F5),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            image != null
                ? Positioned.fill(
                    child: Image.file(
                      File(image!.path),
                      fit: BoxFit.cover, // Fit the image within the container
                    ),
                  )
                : const Text(''),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      )
                    ],
                  ),
                  child: const Icon(Iconsax.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
