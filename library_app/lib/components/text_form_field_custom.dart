import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'package:flutter/services.dart' show SmartQuotesType, SmartDashesType;

class TextFormFieldCustom extends FormField<String> {
  TextFormFieldCustom(
      {super.key,
      this.controller,
      String? initialValue,
      FocusNode? focusNode,
      InputDecoration? decoration,
      TextInputType? keyboardType,
      TextCapitalization textCapitalization = TextCapitalization.none,
      TextInputAction? textInputAction,
      TextStyle? style,
      TextStyle? labelStyle,
      StrutStyle? strutStyle,
      TextDirection? textDirection,
      TextAlign textAlign = TextAlign.start,
      TextAlignVertical? textAlignVertical,
      bool autofocus = false,
      bool readOnly = false,
      ToolbarOptions? toolbarOptions,
      bool? showCursor,
      String obscuringCharacter = '•',
      bool obscureText = false,
      bool autocorrect = true,
      SmartDashesType? smartDashesType,
      SmartQuotesType? smartQuotesType,
      bool enableSuggestions = true,
      MaxLengthEnforcement? maxLengthEnforcement,
      int? maxLines = 1,
      int? minLines,
      bool expands = false,
      int? maxLength,
      ValueChanged<String>? onChanged,
      GestureTapCallback? onTap,
      VoidCallback? onKeyboardDone,
      ValueChanged<String>? onFieldSubmitted,
      super.onSaved,
      List<String? Function(String?)>? validators,
      List<TextInputFormatter>? inputFormatters,
      bool? enabled,
      double cursorWidth = 2.0,
      double? cursorHeight,
      Radius? cursorRadius,
      Color? cursorColor,
      Brightness? keyboardAppearance,
      EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
      bool? enableInteractiveSelection,
      TextSelectionControls? selectionControls,
      InputCounterWidgetBuilder? buildCounter,
      ScrollPhysics? scrollPhysics,
      Iterable<String>? autofillHints,
      AutovalidateMode? autovalidateMode,
      ScrollController? scrollController,
      super.restorationId,
      bool enableIMEPersonalizedLearning = true,
      MouseCursor? mouseCursor,
      String? label,
      String? hintText,
      Widget? suffix,
      bool isShowClear = true,
      String? labelText,
      EdgeInsetsGeometry? contentPadding})
      : assert(initialValue == null || controller == null),
        assert(textAlign != null),
        assert(autofocus != null),
        assert(readOnly != null),
        assert(obscuringCharacter != null && obscuringCharacter.length == 1),
        assert(obscureText != null),
        assert(autocorrect != null),
        assert(enableSuggestions != null),
        assert(scrollPadding != null),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(expands != null),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength == TextField.noMaxLength || maxLength > 0),
        assert(enableIMEPersonalizedLearning != null),
        super(
          // validator: validators != null ? Validators.handle(validators) : null,
          initialValue: controller != null ? controller.text : (initialValue ?? ''),
          enabled: enabled ?? decoration?.enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<String> field) {
            final _TextFormFieldCustomState state = field as _TextFormFieldCustomState;
            final suffixes = Wrap(
                spacing: 8,
                runAlignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [if (suffix != null) suffix, SizedBox.shrink()]);
            final InputDecoration effectiveDecoration = (decoration ??
                    InputDecoration(hintText: hintText, suffix: suffixes, labelText: labelText))
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null) ...[
                    Text(
                      label,
                      style: labelStyle ?? Theme.of(field.context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  TextField(
                    restorationId: restorationId,
                    controller: state._effectiveController,
                    focusNode: focusNode,
                    decoration: effectiveDecoration.copyWith(errorText: field.errorText),
                    keyboardType: keyboardType,
                    textInputAction: textInputAction,
                    style: style,
                    strutStyle: strutStyle,
                    textAlign: textAlign,
                    textAlignVertical: textAlignVertical,
                    textDirection: textDirection,
                    textCapitalization: textCapitalization,
                    autofocus: autofocus,
                    toolbarOptions: toolbarOptions,
                    readOnly: readOnly,
                    showCursor: showCursor,
                    obscuringCharacter: obscuringCharacter,
                    obscureText: obscureText,
                    autocorrect: autocorrect,
                    smartDashesType: smartDashesType ??
                        (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
                    smartQuotesType: smartQuotesType ??
                        (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
                    enableSuggestions: enableSuggestions,
                    maxLengthEnforcement: maxLengthEnforcement,
                    maxLines: maxLines,
                    minLines: minLines,
                    expands: expands,
                    maxLength: maxLength,
                    onChanged: onChangedHandler,
                    onTap: onTap,
                    onEditingComplete: onKeyboardDone,
                    onSubmitted: onFieldSubmitted,
                    inputFormatters: inputFormatters,
                    enabled: enabled ?? decoration?.enabled ?? true,
                    cursorWidth: cursorWidth,
                    cursorHeight: cursorHeight,
                    cursorRadius: cursorRadius,
                    cursorColor: cursorColor,
                    scrollPadding: scrollPadding,
                    scrollPhysics: scrollPhysics,
                    keyboardAppearance: keyboardAppearance,
                    enableInteractiveSelection:
                        enableInteractiveSelection ?? (!obscureText || !readOnly),
                    selectionControls: selectionControls,
                    buildCounter: buildCounter,
                    autofillHints: autofillHints,
                    scrollController: scrollController,
                    enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
                    mouseCursor: mouseCursor,
                  ),
                ],
              ),
            );
          },
        );

  factory TextFormFieldCustom.date({
    final TextEditingController? controller,
    final VoidCallback? onTap,
    final Function(String?)? onSaved,
    final String? labelText,
    final List<String? Function(String?)>? validators,
    final AutovalidateMode? autovalidateMode,
    final bool? readOnly,
    InputDecoration? decoration,
  }) {
    return TextFormFieldCustom(
      controller: controller,
      labelText: labelText,
      readOnly: readOnly ?? true,
      decoration: decoration,
      onSaved: onSaved,
      onTap: onTap,
      validators: validators,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
    );
  }

  factory TextFormFieldCustom.text({
    final Key? key,
    final String? label,
    final String? labelText,
    final bool obscureText = false,
    final TextInputType keyboardType = TextInputType.text,
    final int? maxLines,
    final int? minLines,
    final String? initialValue,
    final String? hintText,
    final int? maxLength,
    final List<TextInputFormatter>? inputFormatters,
    final Function(String)? onChanged,
    final void Function(String?)? onSaved,
    final TextEditingController? controller,
    final VoidCallback? onTap,
    final FocusNode? focusNode,
    final List<String? Function(String?)>? validators,
    final void Function()? onKeyboardDone,
    final AutovalidateMode? autovalidateMode,
  }) {
    return TextFormFieldCustom(
      key: key,
      controller: controller,
      label: label,
      labelText: labelText,
      readOnly: false,
      keyboardType: keyboardType,
      hintText: hintText,
      obscureText: obscureText,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      minLines: minLines,
      initialValue: initialValue,
      onChanged: onChanged,
      validators: validators,
      onTap: onTap,
      focusNode: focusNode,
      onSaved: onSaved,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onKeyboardDone: onKeyboardDone,
    );
  }

  static Widget password(
      {TextEditingController? controller,
      String? label,
      final String? labelText,
      String? hint,
      bool readOnly = false,
      bool require = true,
      String? fieldValueCompare,
      Function(String)? onChanged,
      final AutovalidateMode? autovalidateMode,
      final List<String? Function(String?)>? validators,
      final FocusNode? focusNode}) {
    final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureText,
      builder: (_, value, __) => TextFormFieldCustom(
        onChanged: onChanged,
        label: label,
        labelText: labelText,
        hintText: hint,
        controller: controller,
        readOnly: readOnly,
        // isShowClear: true,
        focusNode: focusNode,
        autovalidateMode: autovalidateMode,
        suffix: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: InkWell(
              onTap: () => _obscureText.value = !_obscureText.value,
              child: !value
                  ? Icon(
                      CupertinoIcons.eye,
                      size: 18,
                    )
                  : Icon(
                      CupertinoIcons.eye_slash,
                      size: 18,
                    )),
        ),
        obscureText: _obscureText.value,
        validators: validators,
      ),
    );
  }

  static Widget readOnly(
      {Color? backgroundColor,
      required Widget child,
      BoxBorder? border,
      EdgeInsetsGeometry? padding}) {
    return Container(
      height: 50,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor, border: border),
      child: child,
    );
  }

  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController => _textFormField.controller ?? _controller!.value;

  TextFormFieldCustom get _textFormField => super.widget as TextFormFieldCustom;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }

    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_textFormField.controller == null) {
      _createLocalController(
          widget.initialValue != null ? TextEditingValue(text: widget.initialValue!) : null);
    } else {
      _textFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(TextFormFieldCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_textFormField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _textFormField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _textFormField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_textFormField.controller != null) {
        setValue(_textFormField.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _textFormField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
