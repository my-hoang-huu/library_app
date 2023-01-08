import 'package:flutter/material.dart';
import 'package:library_app/presentation/components/default_button.dart';

import '../text_form_field_custom.dart';

abstract class BottomSheetLayout extends StatefulWidget {
  const BottomSheetLayout({super.key});

  @override
  BottomSheetLayoutState createState();
}

abstract class BottomSheetLayoutState<T extends BottomSheetLayout> extends State<T> {
  SizedBox get mainSpace => const SizedBox(
        height: 16,
      );

  String get title;

  String get buttonTitle;

  double get horizontalPadding => 16;

  SizedBox get spaceUnderTitle => const SizedBox(
        height: 20,
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            _topGreyLine(context),
            const SizedBox(
              height: 14,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Divider(
              thickness: .5,
              color: Theme.of(context).dividerColor,
            ),
            spaceUnderTitle,
            Container(
              margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...body(context),
                  const SizedBox(
                    height: 32,
                  ),
                  DefaultButton(press: () => onSubmit(context), text: buttonTitle),
                ],
              ),
            ),
            const SizedBox(
              height: 52,
            )
          ],
        ),
      ),
    );
  }

  void onSubmit(BuildContext context);

  List<Widget> body(BuildContext context);

  Container _topGreyLine(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget dateLine(BuildContext context,
      {String? hintText, TextEditingController? controller, void Function()? onTap}) {
    return TextFormFieldCustom.date(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
              hintText: hintText ?? "Khoảng thời gian",
              suffixIcon: const Icon(Icons.calendar_month))
          .applyDefaults(Theme.of(context).inputDecorationTheme),
      onTap: onTap,
    );
  }

  Row nameLine() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextFormFieldCustom.text(
            hintText: "Tên",
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 5,
          child: TextFormFieldCustom.text(
            hintText: "Họ và tên đệm",
          ),
        )
      ],
    );
  }
}

Future<dynamic> showCustomBottomSheet<T extends BottomSheetLayout>(
    {required BuildContext context, required T bottomSheetWidget}) {
  return showModalBottomSheet(
    context: context,
    enableDrag: false,
    isDismissible: true,
    isScrollControlled: true,
    shape:
        const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    builder: (context) {
      return bottomSheetWidget;
    },
  );
}
