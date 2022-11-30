import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AvatarWidget extends StatelessWidget {
  final String text;
  final String? imgUrl;
  final bool isEdit;
  final Color? color;
  final VoidCallback onClicked;

  const AvatarWidget({
    Key? key,
    required this.text,
    this.imgUrl,
    this.isEdit = false,
    this.color,
    required this.onClicked,
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
            child: GestureDetector(
              onTap: onClicked,
              child: buildEditIcon(color!),
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
