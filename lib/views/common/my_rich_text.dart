import '../../pkgs.dart';

class MyRichText extends StatelessWidget {
  final String title;
  final String value;
  final bool isImportant;

  const MyRichText(
      {Key key,
      @required this.title,
      @required this.value,
      this.isImportant = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (!value.isEmptyOrNull)
        ? Column(
            children: [
              10.heightBox,
              "$title - ".richText.caption(context).withTextSpanChildren([
                if (isImportant)
                  value.textSpan.extraBold.size(16).red400.make()
                else
                  value.textSpan.semiBold.make()
              ]).make(),
            ],
          )
        : const Offstage();
  }
}

class MySelectableRichText extends StatelessWidget {
  final String title;
  final String value;

  const MySelectableRichText(
      {Key key, @required this.title, @required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (!value.isEmptyOrNull)
        ? Column(
            children: [
              10.heightBox,
              Wrap(
                children: [
                  "$title - ".text.caption(context).make(),
                  value.selectableText.semiBold.make()
                ],
              )
            ],
          )
        : const Offstage();
  }
}
