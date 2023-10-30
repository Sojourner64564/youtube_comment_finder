import 'package:flutter/cupertino.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/assets/colors/my_colors.dart';

class MyTextStyles{
  static const topLevelCommentTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: MyColors.lightGreyTextColor
  );

  static const bottomLevelCommentTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 13,
      color: MyColors.lightGreyTextColor
  );

  static const middleSizeGreyTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: MyColors.lightGreyTextColor,
  );

  static const smallSizeGreyTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: MyColors.lightGreyTextColor,
  );

  static const largeThiccSizeGreyTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: MyColors.lightGreyTextColor,
  );

  static const smallSizeRedTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: MyColors.redAccentThemeColor,
  );
}