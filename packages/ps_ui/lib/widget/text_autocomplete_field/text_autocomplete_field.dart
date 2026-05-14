import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_dimens.dart';
import 'package:ps_ui/theme/app_text_style.dart';
import 'package:ps_ui/widget/text_autocomplete_field/text_autocomplete_field_style.dart';
export 'text_autocomplete_field_style.dart';

/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixIcon - Pass Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus node
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  parametersValidate - Value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onSubmitField - Done click action
/// *  onFieldTap - On focus on TextField
class PSTextAutoCompleteField<T> extends StatefulWidget {
  final TextInputType? textInputType;
  final TextAlign textAlign;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? defaultText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? functionValidate;
  final String? Function(T?)? onSuggestionSelected;
  final String Function(T) getTitle;
  final String Function(T) getSubTitle;

  final Function(String)? onFocus;
  final Function(String)? onUnFocus;
  final Function(String)? onChanged;
  final String? parametersValidate;
  final TextInputAction actionKeyboard;
  // final SuggestionsController<T> suggestionsBoxController;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final Function(String)? suggestionOption;
  // final List<CreateInvestUserInfo> suggestionOption;

  final String? errorText;
  final int? maxLength;
  final int maxLines;
  final bool isOutlineBorder;
  final bool showObscureIcon;
  final bool showClearIcon;
  final Color enabledBorderColor;
  final Color focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final bool isEnabled;
  final bool keepBottomSpace;
  final List<TextInputFormatter>? inputFormatters;
  final PSTextAutoCompleteFieldStyle style;

  const PSTextAutoCompleteField(
      {Key? key,
      required this.hintText,
      this.textInputType,
      this.textAlign = TextAlign.start,
      this.defaultText,
      this.obscureText = false,
      this.showObscureIcon = false,
      this.showClearIcon = false,
      required this.style,
      required this.getTitle,
      required this.getSubTitle,
      this.controller,
      this.functionValidate,
      this.onChanged,
      this.onFocus,
      this.onUnFocus,
      this.parametersValidate,
      this.actionKeyboard = TextInputAction.next,
      required this.suggestionOption,
      // required this.suggestionsBoxController,
      this.onSuggestionSelected,
      this.onSubmitField,
      this.onFieldTap,
      this.prefixIcon,
      this.suffixIcon,
      this.errorText,
      this.maxLength,
      this.maxLines = 1,
      this.isOutlineBorder = false,
      this.focusedBorder = PSColors.primaryColor,
      this.enabledBorderColor = PSColors.greyScaleDark4,
      this.contentPadding,
      this.isEnabled = true,
      this.keepBottomSpace = false,
      this.inputFormatters})
      : super(key: key);

  @override
  _PSTextAutoCompleteFieldState<T> createState() =>
      _PSTextAutoCompleteFieldState<T>();
}

class _PSTextAutoCompleteFieldState<T>
    extends State<PSTextAutoCompleteField<T>> {
  double bottomPaddingToError = 12;
  final FocusNode _focus = FocusNode();
  bool isActive = false;
  bool _obscureText = false;

  bool get isError => (widget.errorText ?? "").isNotEmpty;

  late SuggestionsController<T> suggestionsBoxController;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focus.addListener(_onFocusChange);

    suggestionsBoxController = SuggestionsController();
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onFocusChange() {
    if (!_focus.hasFocus && widget.onUnFocus != null) {
      widget.onUnFocus?.call(widget.controller?.text ?? "");
    }

    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // accentColor: Palette.colorActionableText,
        primaryColor: PSColors.greyScaleDark4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              widget.onFieldTap?.call();
            },
            child: AbsorbPointer(
              absorbing: !widget.isEnabled,
              child: Container(
                  decoration: BoxDecoration(
                    color: widget.isEnabled
                        ? widget.style.background
                        : widget.style.disabledBackground,
                    borderRadius: BorderRadius.circular(4),
                    border: !widget.isOutlineBorder
                        ? null
                        : isError
                            ? Border.all(
                                color: widget.style.errorColor, width: 0.8)
                            : isActive
                                ? Border.all(
                                    color: PSColors.primaryColor, width: 0.8)
                                : Border.all(
                                    color: widget.enabledBorderColor,
                                    width: 0.8),
                  ),
                  child: TypeAheadField<T>(
                    // loadingBuilder: (context) => const Text('Loading...'),
                    errorBuilder: (context, error) =>
                        Text('Error! ${error.toString()}'),
                    // emptyBuilder: (context) => const Text('No items found!'),

                    builder: (context, controller, focusNode) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        autofocus: false,
                        decoration: InputDecoration(
                          //counterStyle: Put Style here,
                          border: InputBorder.none,
                          labelText: widget.hintText,
                          floatingLabelStyle: TextStyle(
                            color: (widget.errorText ?? "").isEmpty
                                ? PSColors.boxShadowColor
                                : widget.style.errorColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          alignLabelWithHint: false,
                          enabled: widget.isEnabled,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: widget.prefixIcon,
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 30,
                            minHeight: 15,
                          ),
                          suffixIconConstraints: const BoxConstraints(
                            minWidth: 30,
                            minHeight: 15,
                          ),

                          hintText: widget.hintText,
                          hintStyle: const TextStyle(
                            color: PSColors.greyScaleDark4,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.8,
                          ),
                          contentPadding: widget.contentPadding ??
                              const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 11),
                          isDense: true,

                          errorBorder: widget.isOutlineBorder
                              ? OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: widget.enabledBorderColor,
                                      width: 0.8),
                                )
                              : UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: widget.enabledBorderColor,
                                      width: 0.8),
                                ),
                          focusedErrorBorder: widget.isOutlineBorder
                              ? OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: widget.enabledBorderColor,
                                      width: 1),
                                )
                              : UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: widget.enabledBorderColor,
                                      width: 1),
                                ),
                        ),
                      );
                    },

                    itemSeparatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(
                          height: 1,
                        ),
                      );
                    },
                    // suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                    //   elevation: 4,
                    //   shape: RoundedRectangleBorder(
                    //     side: BorderSide(
                    //         color: PSColors.gray02), //the outline color
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(4),
                    //     ),
                    //   ),
                    //   color: PSColors.white,
                    // ),
                    // suggestionsBoxController: widget.suggestionsBoxController,
                    suggestionsController: suggestionsBoxController,
                    suggestionsCallback: (pattern) async {
                      List<T> list = await widget.suggestionOption!(pattern);
                      return list;
                      // return widget.suggestionOption!(pattern);
                    },
                    itemBuilder: (context, item) {
                      return ListTile(
                        title: Text(
                          widget.getTitle(item),
                          //"${item.userFirstName}  ${item.userLastName}",
                          style: PSTextStyle.h4SemiBold(),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        subtitle: Text(widget.getSubTitle(item)
                            // "${item.userEmail}",
                            ),
                        dense: true,
                      );
                    },
                    hideOnEmpty: true,

                    debounceDuration: Duration.zero,
                    animationDuration: Duration.zero,
                    controller: widget.controller,
                    onSelected: (selected) {
                      if (widget.onSuggestionSelected != null) {
                        widget.onSuggestionSelected!(selected);
                      }

                      // Get.back(id: NavigationKey.dashboard);
                      // print("== $suggestion");

                      suggestionsBoxController.close();
                    },
                  )),
            ),
          ),
          if ((widget.errorText ?? "").isNotEmpty)
            Container(
              height: PSDimens.grid32,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text(
                widget.errorText ?? "",
                maxLines: 2,
                style: TextStyle(
                  color: widget.style.errorColor,
                  fontSize: 12,
                  overflow: TextOverflow.fade,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.8,
                ),
              ),
            )
          else if (widget.keepBottomSpace)
            const SizedBox(
              height: PSDimens.grid32,
            )
        ],
      ),
    );
  }

  String? commonValidation(String value, String messageError) {
    var required = requiredValidator(value, messageError);
    if (required != null) {
      return required;
    }
    return null;
  }

  String? requiredValidator(value, messageError) {
    if (value.isEmpty) {
      return messageError;
    }
    return null;
  }

  void changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
