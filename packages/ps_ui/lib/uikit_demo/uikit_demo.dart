import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_ui/constant/app_assets.dart';
import 'package:ps_ui/extension/color.dart';
import 'package:ps_ui/model/country.dart';
import 'package:ps_ui/widget/alert_container/alert_container.dart';
import 'package:ps_ui/widget/app_bar/default_appbar.dart';
import 'package:ps_ui/widget/app_container/app_container.dart';
import 'package:ps_ui/widget/app_table_view/app_table_view.dart';
import 'package:ps_ui/widget/basic_alert_container/basic_alert_container.dart';
import 'package:ps_ui/widget/checkbox/checkbox.dart';
import 'package:ps_ui/widget/checkbox/checkbox_style.dart';
import 'package:ps_ui/widget/dot_loader/dot_loader.dart';
import 'package:ps_ui/widget/error_reload_card/error_reload_card.dart';
import 'package:ps_ui/widget/heading_text/heading_text.dart';
import 'package:ps_ui/widget/icon_button/icon_button.dart';
import 'package:ps_ui/widget/icon_button/icon_button_v2.dart';
import 'package:ps_ui/widget/mark_button/mark_button.dart';
import 'package:ps_ui/widget/primary_button/app_primary_button.dart';
import 'package:ps_ui/widget/primary_icon_button/primary_icon_button.dart';
import 'package:ps_ui/widget/radio_button/radio_button.dart';
import 'package:ps_ui/widget/scrollable_table/scrollable_table.dart';
import 'package:ps_ui/widget/search_field/search_field.dart';
import 'package:ps_ui/widget/shimmer/shimmer.dart';
import 'package:ps_ui/widget/text_button/text_button.dart';
import 'package:ps_ui/widget/text_field/app_phone_field.dart';
import 'package:ps_ui/widget/text_field/app_text_field.dart';
import 'package:ps_ui/widget/text_field/app_textarea_field.dart';
import 'package:ps_ui/widget/text_label/text_label.dart';
import 'package:ps_ui/widget/toast/toast.dart';
import 'package:ps_ui/widget/view_more_button/view_more_button.dart';

import '../theme/theme.dart';

class PSUIKitDemoScreen extends StatelessWidget {
  const PSUIKitDemoScreen({super.key});

  ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PSDefaultAppbar(),
      body: SafeArea(
        child: ListView(
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 8),
            demoText(),
            Row(
              children: [
                PSCheckbox(
                  text: "Active",
                  style: PSCheckboxStyle.degaultTheme(getTheme(context)),
                  checked: true,
                  listener: (value) {},
                ),
                const SizedBox(width: 20),
                PSCheckbox(
                  text: "Inactive",
                  style: PSCheckboxStyle.degaultTheme(getTheme(context)),
                  checked: false,
                  listener: (value) {},
                ),
              ],
            ),
            Row(
              children: [
                PSRadioButton(
                  title: "Active",
                  isSelected: true,
                  onChanged: () {
                    // updateTimeRange(e);
                  },
                ),
                const SizedBox(width: 20),
                PSRadioButton(
                  title: "Inactive",
                  isSelected: false,
                  onChanged: () {
                    // updateTimeRange(e);
                  },
                ),
              ],
            ),
            PSErrorCard(
              showRetryButtonOnly: true,
              onTap: () {},
              hideDecorations: false,
              showBoxShadow: true,
            ),
            PSViewMoreButton(
              isLoading: false,
              onTap: () {},
              // padding: const EdgeInsets.only(bottom: 36),
              visibility: true,
              padding: const EdgeInsets.only(bottom: 48),
              theme: PSTextButtonStyle.defaultTheme(getTheme(context)),
            ),
            PSTextButton(
              style: PSTextButtonStyle.defaultTheme(getTheme(context)),
              visibility: true,
              isLoading: false,
              child: Text(
                "Use Face ID",
                style: PSTextStyle.h5SemiBold(color: PSColors.primaryColor),
              ),
            ),
            Column(
              children: [
                PSIconButton(
                  icon: Icons.arrow_back,
                  style: PSIconButtonStyle.circular(
                    getTheme(context),
                    buttonSize: PSDimens.grid32,
                  ),
                  onTap: () {},
                ),
                PSIconButton(
                  icon: Icons.arrow_forward,
                  style: PSIconButtonStyle.circular(
                    getTheme(context),
                    buttonSize: PSDimens.grid32,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PSTextLabel(
                  text: "Hello",
                  backgroundColor: PSColors.activeBlue01,
                ),
                PSTextLabel(
                  text: "Hello",
                  backgroundColor: PSColors.yellowBorderColor,
                ),
                PSTextLabel(text: "Hello", backgroundColor: PSColors.red),
                PSTextLabel(
                  text: "Hello",
                  backgroundColor: PSColors.greenBorderColor,
                ),
              ],
            ),
            PSPhoneFormField(
              hintText: "Phone",
              controller: TextEditingController(),
              country: PSCountry(dialCode: "91", code: "IN", name: "India"),
              isOutlineBorder: true,
              onChanged: (_) {},
              // errorText: controller.errorPassword,
              onTapCountryCode: () async {},
              inputFormatters: const [],
              isEnabled: true,
              textInputType: TextInputType.phone,
              maxLines: 1,
              enabledBorderColor: PSColors.greyScaleDark4,
              style: PSTextFieldStyle.defaultTheme(getTheme(context)),
            ),
            PSSearchField(
              hintText: "Search",
              controller: TextEditingController(),
              isOutlineBorder: true,
              onChanged: (text) => {},
              showClearIcon: false,
              keepBottomSpace: false,
              textInputType: TextInputType.text,
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PSDimens.grid12,
                ),
                child: SvgPicture.asset(
                  PSAssets.icSearch,
                  height: PSDimens.grid20,
                ),
              ),
            ),
            PSTextFormField(
              hintText: "First Name",
              controller: TextEditingController(),
              isOutlineBorder: true,
              isEnabled: true,
              showClearIcon: false,
              keepBottomSpace: false,
              textInputType: TextInputType.name,
              style: PSTextFieldStyle.defaultTheme(getTheme(context)),
            ),
            PSTextFormField(
              hintText: "First Name",
              controller: TextEditingController(),
              isOutlineBorder: true,
              isEnabled: false,
              showClearIcon: false,
              keepBottomSpace: false,
              textInputType: TextInputType.name,
              style: PSTextFieldStyle.defaultTheme(getTheme(context)),
            ),
            PSTextAreaField(
              hintText: 'Hello',
              controller: TextEditingController(),
              isOutlineBorder: true,
              onChanged: (value) {
                // textController?.text = (value);
                // displayButton();
              },
              showClearIcon: false,
              // defaultText: "Call be back post 7:30 PM",
              maxLines: 6,
              // focusNode: ,
              keepBottomSpace: false,
              textInputType: TextInputType.text,
            ),
            PSShimmer.basicShimmer(height: 40, radius: 4),
            const SizedBox(height: 10),
            PSShimmer.basicShimmer(height: 20, radius: 4),
            const SizedBox(height: 10),
            PSShimmer.basicShimmer(height: 10, radius: 4),
            const SizedBox(height: 10),
            PSShimmer.basicShimmer(height: 5, radius: 4),
            const SizedBox(height: 10),
            PSShimmer.basicShimmer(height: 2, radius: 4),
            const SizedBox(height: 10),
            const PSThreeDotLoader(PSColors.appbarColor),
            const SizedBox(height: 10),
            TextButton(
              child: const Text('Toast 1'),
              onPressed: () {
                PSToast(
                  style: PSToastStyle.darkTheme(getTheme(context)),
                  message: "App toast message",
                );
              },
            ),
            TextButton(
              child: const Text('Toast 2'),
              onPressed: () {
                PSToast(
                  style: PSToastStyle.defaultTheme(getTheme(context)),
                  message: "App toast message",
                );
              },
            ),
            TextButton(
              child: const Text('Toast 4'),
              onPressed: () {
                PSToast(
                  style: PSToastStyle.errorTheme(getTheme(context)),
                  message: "App toast message",
                );
              },
            ),
            TextButton(
              child: const Text('Toast 4'),
              onPressed: () {
                PSToast(
                  style: PSToastStyle.infoTheme(getTheme(context)),
                  message: "App toast message",
                );
              },
            ),
            TextButton(
              child: const Text('Toast 5'),
              onPressed: () {
                PSToast(
                  style: PSToastStyle.successTheme(getTheme(context)),
                  message: "App toast message",
                );
              },
            ),
            const PSHeadingText(
              text: "Hello World !!",
              linePadding: EdgeInsets.only(left: PSDimens.grid8),
              hideLine: false,
              isTextLeftAligned: true,
            ),
            Row(
              children: [
                PSPrimaryIconButton(
                  style: PSPrimaryIconButtonStyle.customSizeOutline(
                    getTheme(context),
                    padding: const EdgeInsets.all(7),
                    textStyle: PSTextStyle.h4Bold(color: PSColors.primaryColor),
                  ),
                  text: "Note",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: SvgPicture.asset(
                      PSAssets.icEye,
                      height: 8,
                      colorFilter: PSColors.primaryColor.toColorFilter,
                      // opticalSize: 1,
                    ),
                  ),
                  // SvgPicture.asset(
                  //   AppAssets.icFilter,
                  //   heig2ht: 12,
                  // ),
                  onTap: () async {},
                ),
              ],
            ),
            PSIconButtonV2(
              icon: Icons.arrow_back_ios,
              style: PSIconButtonStyle.noBorder(
                getTheme(context),
                buttonSize: PSDimens.grid20,
                padding: const EdgeInsets.symmetric(
                  horizontal: PSDimens.grid24,
                  vertical: 0,
                ),
              ),
              onTap: () {},
            ),
            Row(
              children: [
                PSMarkButton(
                  style: PSMarkButtonStyle.retangular(
                    getTheme(context),
                    buttonSize: PSDimens.grid44,
                  ),
                  icon: Icons.check,
                  onTap: () {},
                ),
                PSMarkButton(
                  style: PSMarkButtonStyle.retangular(
                    getTheme(context),
                    buttonSize: PSDimens.grid44,
                  ),
                  icon: Icons.close,
                  onTap: () {},
                ),
              ],
            ),
            PSPrimaryButton(
              style: PSPrimaryButtonStyle.outlineTheme(
                getTheme(context),
                textStyle: PSTextStyle.h5Bold(color: PSColors.primaryColor),
              ),
              text: "Rent History",
              onTap: () {},
            ),
            const SizedBox(height: 6),
            PSPrimaryButton(
              style: PSPrimaryButtonStyle.defaultTheme(
                getTheme(context),
                textStyle: PSTextStyle.h5Bold(),
              ),
              text: "Rent History",
              onTap: () {},
              isEnabled: false,
            ),
            const SizedBox(height: 6),
            PSPrimaryButton(
              style: PSPrimaryButtonStyle.defaultTheme(
                getTheme(context),
                textStyle: PSTextStyle.h5Bold(color: PSColors.white),
              ),
              text: "Rent History",
              onTap: () {},
              isEnabled: true,
            ),
            const SizedBox(height: 6),
            PSPrimaryButton(
              style: PSPrimaryButtonStyle.defaultTheme(
                getTheme(context),
                textStyle: PSTextStyle.h5Bold(),
              ),
              text: "Rent History",
              onTap: () {},
              isEnabled: true,
              isLoading: true,
            ),
            const SizedBox(height: 6),
            PSAlertContainer(
              margin: const EdgeInsets.only(bottom: PSDimens.grid14),
              style: PSAlertContainerStyle.redTheme(Theme.of(context)),
              child: Row(
                children: [
                  SvgPicture.asset(PSAssets.icCallRed),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PSDimens.grid8,
                      ),
                      child: Text(
                        "time owner | 122232 232}",
                        // "05/06/2023 12:30 PM | Binoy",
                        style: PSTextStyle.h5Medium(color: PSColors.black0),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      "asset name",
                      style: PSTextStyle.h5Regular(color: PSColors.black0),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            PSAlertContainer(
              margin: const EdgeInsets.only(bottom: PSDimens.grid14),
              style: PSAlertContainerStyle.greenTheme(Theme.of(context)),
              child: Row(
                children: [
                  SvgPicture.asset(PSAssets.icCallRing),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PSDimens.grid8,
                      ),
                      child: Text(
                        "time owner | 122232 232}",
                        // "05/06/2023 12:30 PM | Binoy",
                        style: PSTextStyle.h5Medium(color: PSColors.black0),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      "asset name",
                      style: PSTextStyle.h5Regular(color: PSColors.black0),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            const PSContainer(
              padding: EdgeInsets.symmetric(
                horizontal: PSDimens.grid8,
                vertical: PSDimens.grid12,
              ),
              width: double.infinity,
              child: Text("Data not available", textAlign: TextAlign.center),
            ),
            const SizedBox(height: 6),
            PSBasicAlertContainer(
              style: PSBasicAlertContainerStyle.yellowTheme(Theme.of(context)),
              child: const Text("alsdjfa"),
            ),
            const SizedBox(height: 6),
            PSBasicAlertContainer(
              style: PSBasicAlertContainerStyle.greenTheme(Theme.of(context)),
              child: const Text("alsdjfa"),
            ),
            const SizedBox(height: 6),
            PSBasicAlertContainer(
              style: PSBasicAlertContainerStyle.redTheme(Theme.of(context)),
              child: const Text("alsdjfa"),
            ),
            const SizedBox(height: 6),
            PSScrollableTable(
              tableRows: const [
                ["A", "B", "C", "D", "E", "F", "G"],
                ["A", "B", "C", "D", "E", "F", "G"],
                ["A", "B", "C", "D", "E", "F", "G"],
                ["A", "B", "C", "D", "E", "F", "G"],
              ],
              style: PSScrollableTableStyle.defaultTheme(getTheme(context)),
            ),
            const SizedBox(height: 6),
            PSTableView(
              tableHeader: const [
                "A--",
                "B--",
                "C--",
                "D--",
                "E--",
                "F--",
                "G--",
              ],
              tableRows: const [
                ["A", "B", "C", "D", "E", "F", "G"],
                ["A", "B", "C", "D", "E", "F", "G"],
                ["A", "B", "C", "D", "E", "F", "G"],
                ["A", "B", "C", "D", "E", "F", "G"],
              ],
              cellDataMapper: (item) {
                try {
                  return PSTableDataCellModel(
                    highlight: item?.highlight ?? false,
                    highlightColor: item?.highlightColor ?? "",
                    info: item?.info ?? "1",
                    value: item?.value ?? "1",
                  );
                } catch (err) {
                  return PSTableDataCellModel(
                    highlight: false,
                    highlightColor: "",
                    info: "",
                    value: "1--------",
                  );
                }
              },
              onTapInfo: (title, desc) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget demoText() {
    const String text = "Hello World !!";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: PSTextStyle.h8Regular()),
        Text(text, style: PSTextStyle.h7Regular()),
        Text(text, style: PSTextStyle.h6Regular()),
        Text(text, style: PSTextStyle.h5Regular()),
        Text(text, style: PSTextStyle.h45Regular()),
        Text(text, style: PSTextStyle.h4Regular()),
        Text(text, style: PSTextStyle.h3Regular()),
        Text(text, style: PSTextStyle.h2Regular()),
        Text(text, style: PSTextStyle.h1Regular()),

        //
        Text(text, style: PSTextStyle.h8Medium()),
        Text(text, style: PSTextStyle.h7Medium()),
        Text(text, style: PSTextStyle.h6Medium()),
        Text(text, style: PSTextStyle.h5Medium()),
        Text(text, style: PSTextStyle.h45Medium()),
        Text(text, style: PSTextStyle.h4Medium()),
        Text(text, style: PSTextStyle.h3Medium()),
        Text(text, style: PSTextStyle.h2Medium()),
        Text(text, style: PSTextStyle.h1Medium()),
        //
        Text(text, style: PSTextStyle.h8SemiBold()),
        Text(text, style: PSTextStyle.h7SemiBold()),
        Text(text, style: PSTextStyle.h6SemiBold()),
        Text(text, style: PSTextStyle.h5SemiBold()),
        Text(text, style: PSTextStyle.h4SemiBold()),
        Text(text, style: PSTextStyle.h4SemiBold()),
        Text(text, style: PSTextStyle.h3SemiBold()),
        Text(text, style: PSTextStyle.h2SemiBold()),
        Text(text, style: PSTextStyle.h1SemiBold()),
        //
        Text(text, style: PSTextStyle.h8Bold()),
        Text(text, style: PSTextStyle.h7Bold()),
        Text(text, style: PSTextStyle.h6Bold()),
        Text(text, style: PSTextStyle.h5Bold()),
        Text(text, style: PSTextStyle.h4Bold()),
        Text(text, style: PSTextStyle.h4Bold()),
        Text(text, style: PSTextStyle.h3Bold()),
        Text(text, style: PSTextStyle.h2Bold()),
        Text(text, style: PSTextStyle.h1Bold()),
      ],
    );
  }
}
