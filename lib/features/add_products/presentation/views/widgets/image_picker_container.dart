import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerContainer extends StatefulWidget {
  const ImagePickerContainer({super.key, required this.onChanged});
  final ValueChanged<File?> onChanged;
  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        // Pick an image.
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );
        if (image != null) {
          imageFile = File(image.path);
          widget.onChanged(imageFile!);

          setState(() {});
        } else {}
      },
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child:
            imageFile == null
                ? FittedBox(child: Icon(Icons.image_outlined))
                : Stack(
                  children: [
                    Image.file(imageFile!),
                    IconButton(
                      onPressed: () {
                        imageFile = null;
                        setState(() {});
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
      ),
    );
  }
}
