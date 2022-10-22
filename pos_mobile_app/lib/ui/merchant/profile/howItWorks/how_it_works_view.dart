import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/merchant/profile/howItWorks/how_it_works_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class HowItWorksView extends StatelessWidget {
  const HowItWorksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HowItWorksViewModel>.nonReactive(
      viewModelBuilder: () => HowItWorksViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          leadingText: AppString.howItWorksText,
          leadingWidth: double.infinity,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: ListView(
              children: const [
                HowItWorksItem(
                  title: 'Register a merchant account',
                  content:
                      'Your manager/admin will have to create a merchant account under your business account with your email address, where you will be sent a confirmation email. \n\n\nRegister a merchant account with the registered email address, and verify it with the provided OTP code to complete your account registration.',
                ),
                HowItWorksItem(
                  title: 'Complete your profile',
                  content:
                      'Create a password for your account, confirm your name and username in order to gain full control over your account.',
                ),
                HowItWorksItem(
                  title: 'Begin logging transactions',
                  content:
                      'Kick the gear and begin the usage of your account by updating the opening cash, POS, and bank account balances for the day, for an automated calculation of incoming and outgoing transactions.',
                ),
                HowItWorksItem(
                  title: 'Manage logged transactions',
                  content: 'Add, view, edit, and delete transactions.',
                ),
                HowItWorksItem(
                  title: 'Close for the day!',
                  content:
                      'Enter the closing balances for the day, such as cash at hand, balance at bank and POS; and voila! All transactions are saved and a fresh interface is ready for a new day!',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HowItWorksItem extends StatelessWidget {
  const HowItWorksItem({
    Key? key,
    required this.content,
    required this.title,
  }) : super(key: key);
  final String content;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.s12),
      child: Container(
        constraints:
            const BoxConstraints(minHeight: 100, minWidth: double.infinity),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Column(
            //   children: [
            //     SvgPicture.asset(
            //       'assets/images/HowItWorksIcon.svg',
            //     ),
            //   ],
            // ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  'assets/images/HowItWorksIcon.svg',
                )
              ],
            ),
            const SizedBox(width: AppSize.s20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: FontSize.s18,
                      color: ColorManager.kHowItWorksTitle,
                    ),
                  ),
                  const SizedBox(height: AppSize.s20),
                  Text(content,
                      style: const TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.kHowItWorksContent,
                      ),
                      textAlign: TextAlign.left)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
