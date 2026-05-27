import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ps_ui/model/country.dart';
import 'package:ps_ui/theme/theme.dart';
import 'package:ps_ui/widget/text_field/app_text_field_style.dart';

export 'app_text_field_style.dart';

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
class PSPhoneFormField extends StatefulWidget {
  final TextInputType? textInputType;
  final TextAlign textAlign;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? defaultText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? functionValidate;
  final Function(String)? onFocus;
  final Function(String)? onUnFocus;
  final Function(String)? onChanged;
  final Function()? onTapCountryCode;
  final String? parametersValidate;
  final TextInputAction actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
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
  final PSCountry? country;
  final List<TextInputFormatter>? inputFormatters;
  final PSTextFieldStyle style;
  final Widget arrowWidget;

  const PSPhoneFormField(
      {super.key,
      required this.hintText,
      this.textInputType,
      this.textAlign = TextAlign.start,
      this.defaultText,
      this.obscureText = false,
      this.showObscureIcon = false,
      this.showClearIcon = false,
      required this.style,
      this.country,
      this.onTapCountryCode,
      this.controller,
      this.functionValidate,
      this.onChanged,
      this.onFocus,
      this.onUnFocus,
      this.parametersValidate,
      this.actionKeyboard = TextInputAction.next,
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
      this.arrowWidget = const SizedBox.shrink(),
      this.inputFormatters});

  @override
  PSPhoneFormFieldState createState() => PSPhoneFormFieldState();
}

class PSPhoneFormFieldState extends State<PSPhoneFormField> {
  double bottomPaddingToError = 12;
  final FocusNode _focus = FocusNode();
  bool isActive = false;
  bool _obscureText = false;

  bool get isError => (widget.errorText ?? "").isNotEmpty;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focus.addListener(_onFocusChange);
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

  String? getCountryDialCode() {
    return widget.country?.dialCode;
  }

  String? getCountryCode() {
    return widget.country?.code?.toLowerCase();
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
          Container(
            decoration: BoxDecoration(
              color: widget.isEnabled
                  ? widget.style.background
                  : widget.style.disabledBackground,
              borderRadius: BorderRadius.circular(4),
              border: !widget.isOutlineBorder
                  ? null
                  : isError
                      ? Border.all(color: widget.style.errorColor, width: 0.8)
                      : isActive
                          ? Border.all(color: PSColors.primaryColor, width: 0.8)
                          : Border.all(
                              color: widget.enabledBorderColor, width: 0.8),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    if (widget.onTapCountryCode != null) {
                      widget.onTapCountryCode?.call();
                    }
                  },
                  child: Row(children: [
                    const SizedBox(width: 8),
                    // const Icon(Icons.flag),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://flagcdn.com/w80/${getCountryCode()}.png",
                            // width: 20,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Container(color: PSColors.gray01);
                            },
                          )),
                    ),
                    const SizedBox(width: 8),
                    Text(getCountryDialCode() ?? ""),
                    widget.arrowWidget,
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  height: 20,
                  width: 1,
                  color: PSColors.gray01,
                ),
                Expanded(
                  child: TextFormField(
                    cursorColor: widget.style.cursorColor,
                    obscureText: _obscureText,
                    keyboardType: widget.textInputType,
                    textAlign: widget.textAlign,
                    textInputAction: widget.actionKeyboard,
                    focusNode: _focus,
                    enabled: widget.isEnabled,
                    maxLength: widget.maxLength,
                    maxLines: widget.maxLines,
                    inputFormatters: widget.inputFormatters ?? [],
                    style: const TextStyle(
                      color: PSColors.greyScaleDark0,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.5,
                    ),
                    initialValue: widget.defaultText,
                    decoration: InputDecoration(
                      //counterStyle: Put Style here,
                      border: InputBorder.none,
                      // labelText: "",
                      floatingLabelStyle: TextStyle(
                        color: (widget.errorText ?? "").isEmpty
                            ? PSColors.boxShadowColor
                            : widget.style.errorColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      alignLabelWithHint: false,
                      enabled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: widget.prefixIcon,
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 30,
                        minHeight: 15,
                      ),
                      suffixIcon: getSuffixIcon(),
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 30,
                        minHeight: 15,
                      ),
                      hintText: widget.hintText,
                      contentPadding: widget.contentPadding ??
                          const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 11),
                      isDense: true,
                      errorBorder: widget.isOutlineBorder
                          ? OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: widget.enabledBorderColor, width: 0.8),
                            )
                          : UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: widget.enabledBorderColor, width: 0.8),
                            ),
                      focusedErrorBorder: widget.isOutlineBorder
                          ? OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: widget.enabledBorderColor, width: 1),
                            )
                          : UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: widget.enabledBorderColor, width: 1),
                            ),
                      // errorText: widget.errorText
                      /*errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.colorPrimary),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.colorPrimary),
                      ),*/
                    ),
                    controller: widget.controller,
                    validator: widget.functionValidate,
                    onFieldSubmitted: (value) {
                      if (widget.onSubmitField != null) widget.onSubmitField!();
                    },
                    onTap: () {
                      if (widget.onFieldTap != null) widget.onFieldTap!();
                    },
                    onChanged: widget.onChanged,
                  ),
                ),
              ],
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

  Widget? getSuffixIcon() {
    if (widget.showClearIcon) {
      return IconButton(
          onPressed: () {
            widget.controller?.text = "";
            setState(() {});
          },
          icon: Icon(
            Icons.close,
            color: widget.style.errorColor,
          ));
    } else if (widget.showObscureIcon) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.black54,
        ),
        onPressed: () {
          toggleObscureText();
        },
      );
    } else {
      return widget.suffixIcon;
    }
  }

  void changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
