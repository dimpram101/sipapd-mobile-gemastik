import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String imgUrl;

  const ImageDialog({super.key, required this.imgUrl});

  Future<Image> _getImage() async {
    return Image.network(imgUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FutureBuilder(
        future: _getImage(),
        builder: (context, AsyncSnapshot<Image> image) {
          if (image.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (image.hasData) {
            return image.data as Widget; // image is ready
          } else {
            return const Text("No photo available"); // placeholder
          }
        },
      ),
    );
  }
}
