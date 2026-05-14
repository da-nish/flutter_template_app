import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ps_ui/theme/app_colors.dart';

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
class PSSearchField extends StatefulWidget {
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
  final String? parametersValidate;
  final TextInputAction actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final String? errorText;
  final int? maxLength;
  // final int maxLines;
  final bool isOutlineBorder;
  final bool showObscureIcon;
  final bool showClearIcon;
  final Color enabledBorderColor;
  final Color focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final bool isEnabled;
  final bool keepBottomSpace;
  final List<TextInputFormatter>? inputFormatters;

  const PSSearchField(
      {super.key,
      required this.hintText,
      this.textInputType,
      this.textAlign = TextAlign.start,
      this.defaultText,
      this.obscureText = false,
      this.showObscureIcon = false,
      this.showClearIcon = false,
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
      // this.maxLines = 1,
      this.isOutlineBorder = false,
      this.focusedBorder = PSColors.primaryColor,
      this.enabledBorderColor = PSColors.cardBorder,
      this.contentPadding,
      this.isEnabled = true,
      this.keepBottomSpace = false,
      this.inputFormatters});

  @override
  PSSearchFieldState createState() => PSSearchFieldState();
}

class PSSearchFieldState extends State<PSSearchField> {
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

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // accentColor: Palette.colorActionableText,
        primaryColor: PSColors.greyScaleDark4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: PSColors.liteBlueBackground,
              borderRadius: BorderRadius.circular(4),
              border: !widget.isOutlineBorder
                  ? null
                  : isActive
                      ? Border.all(color: PSColors.cardBorder, width: 0.8)
                      : Border.all(
                          color: widget.enabledBorderColor, width: 0.8),
            ),
            child: SizedBox(
              height: 41,
              child: Center(
                child: TextField(
                  cursorColor: PSColors.primaryColor,
                  // obscureText: _obscureText,
                  // keyboardType: widget.textInputType,
                  // textAlign: widget.textAlign,
                  textInputAction: widget.actionKeyboard,
                  focusNode: _focus,

                  // enabled: widget.isEnabled,
                  // maxLength: widget.maxLength,
                  // maxLines: 1, //widget.maxLines,
                  // inputFormatters: widget.inputFormatters ?? [],
                  // style: const TextStyle(
                  //   color: PSColors.greyScaleDark0,
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w400,
                  //   fontStyle: FontStyle.normal,
                  //   letterSpacing: 0.5,
                  // ),
                  // // initialValue: widget.defaultText,

                  decoration: InputDecoration(
                    //counterStyle: Put Style here,

                    border: InputBorder.none,
                    // labelText: widget.hintText,

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
                    // enabledBorder: widget.isOutlineBorder
                    //     ? OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: widget.enabledBorderColor, width: 0.8),
                    //       )
                    //     : UnderlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: widget.enabledBorderColor, width: 0.8),
                    //       ),
                    // focusedBorder: widget.isOutlineBorder
                    //     ? const OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: PSColors.primaryColor, width: 1),
                    //       )
                    //     : const UnderlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: PSColors.primaryColor, width: 1),
                    //       ),
                    /*enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.colorPrimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.colorPrimary),
                    ),*/
                    hintStyle: const TextStyle(
                      color: PSColors.greyScaleDark4,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.8,
                    ),
                    // contentPadding: EdgeInsets.zero,
                    contentPadding: widget.contentPadding ??
                        const EdgeInsets.symmetric(horizontal: 16),
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
                  // validator: widget.functionValidate,
                  // onFieldSubmitted: (value) {
                  //   if (widget.onSubmitField != null) widget.onSubmitField!();
                  // },
                  onTap: () {
                    if (widget.onFieldTap != null) widget.onFieldTap!();
                  },
                  onChanged: widget.onChanged,
                ),
              ),
            ),
          ),
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
          icon: const Icon(
            Icons.close,
            color: PSColors.errorColor,
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
