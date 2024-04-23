import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Photoviewer extends StatelessWidget {
  final String img;
  const Photoviewer({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
        imageProvider: AssetImage("assets/images/$img"),
        backgroundDecoration: const BoxDecoration(
            // color: themeData.colorScheme.onBackground.withOpacity(0.8),
            ),
        // enableRotation: widget.isParentRotation,
        errorBuilder: (BuildContext context, Object obj, StackTrace? stck) {
          return Center(
            child: Icon(
              Icons.help_outline,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          );
        });
  }
}
