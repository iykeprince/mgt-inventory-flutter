import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

const String CAMERA = 'CAMERA';
const String GALLERY = 'GALLERY';
const String BROWSE_FILE = 'BROWSE_FILE';

class AvatarWidget extends StatelessWidget {
  final String text;
  final String? imgUrl;
  final bool isEdit;
  final Color? color;
  final VoidCallback? onGalleryClicked;
  final VoidCallback? onCameraClicked;
  final VoidCallback? onBrowseFileClicked;

  const AvatarWidget({
    Key? key,
    required this.text,
    this.imgUrl,
    this.isEdit = false,
    this.color,
    required this.onGalleryClicked,
    required this.onBrowseFileClicked,
    required this.onCameraClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          imgUrl == null ? buildText() : buildImage(imgUrl!),
          Positioned(
            bottom: 0,
            right: 4,
            child: PopupMenuButton<String>(
              initialValue: null,
              // Callback that sets the selected popup menu item.
              child: buildEditIcon(color!),
              onSelected: (String item) {
                if (item == GALLERY) {
                  onGalleryClicked!();
                } else if (item == CAMERA) {
                  onCameraClicked!();
                } else {
                  onBrowseFileClicked!();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: CAMERA,
                  child: Text('Take a Photo'),
                ),
                const PopupMenuItem<String>(
                  value: GALLERY,
                  child: Text('Select from Photo Library'),
                ),
                const PopupMenuItem<String>(
                  value: BROWSE_FILE,
                  child: Text('Browse File'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText() {
    return ClipOval(
      child: Material(
        color: color,
        child: Container(
          color: Colors.transparent,
          alignment: AlignmentDirectional.center,
          child: Text(
            text.toUpperCase(),
            style: getBoldStyle(
                color: ColorManager.kWhiteColor, fontSize: FontSize.s40),
          ),
          width: 120,
          height: 120,
        ),
      ),
    );
  }

  Widget buildImage(String imgUrl) {
    return ClipOval(
      child: Material(
        color: color,
        child: Container(
          color: Colors.transparent,
          alignment: AlignmentDirectional.center,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imgUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
              color: ColorManager.kWhiteColor,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          width: 120,
          height: 120,
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: ColorManager.kSecondaryColor,
          all: 8,
          child: Icon(
            isEdit ? Icons.image : Icons.edit,
            color: Colors.white,
            size: AppSize.s20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
