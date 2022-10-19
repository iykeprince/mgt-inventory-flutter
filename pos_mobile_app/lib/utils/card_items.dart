import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/string_manager.dart';

class CardItem {
  final String? imgUrl;
  final String? title;
  final String? amount;
  final Color? color;
  final Color? titleColor;
  final Color? amountColor;
  CardItem(
      {this.imgUrl,
      this.title,
      this.amount,
      this.color,
      this.titleColor,
      this.amountColor});
}

class CardItems {
  static List<CardItem> items(BuildContext context) {
    return [
      CardItem(
        imgUrl: 'assets/images/MerchantDashboard/transaction.png',
        amount: '5000',
        color: ColorManager.kPrimaryColor,
        title: AppString.balCashAtHandText,
        titleColor: ColorManager.kWhiteColor,
        amountColor: ColorManager.kWhiteColor,
      ),
      CardItem(
        imgUrl: 'assets/images/MerchantDashboard/transaction.png',
        amount: '5000',
        title: AppString.totalWithdrawalText,
      ),
      CardItem(
        imgUrl: 'assets/images/MerchantDashboard/transaction.png',
        amount: '5000',
        title: AppString.totalProfitMadeText,
      ),
      CardItem(
        imgUrl: 'assets/images/MerchantDashboard/transaction.png',
        amount: '5000',
        title: AppString.openingBalanceText,
      ),
    ];
  }
}
