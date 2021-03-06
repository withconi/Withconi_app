import 'package:flutter_svg/svg.dart';

import '../../../import_basic.dart';

class WcIconTextButton extends StatelessWidget {
  WcIconTextButton(
      {Key? key,
      required this.active,
      required this.onTap,
      required this.iconSrc,
      required this.activeIconColor,
      required this.inactiveIconColor,
      required this.text,
      this.iconWidth = double.infinity,
      this.iconHeight = 19.5})
      : super(key: key);

  final void Function()? onTap;
  String iconSrc;
  Color activeIconColor;
  Color inactiveIconColor;
  String text;
  bool active;
  double iconHeight;
  double iconWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 5, 9, 4),
        color: WcColors.white,
        child: Row(
          children: [
            SvgPicture.asset(
              iconSrc,
              height: iconHeight,
              color: (active) ? activeIconColor : inactiveIconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: WcColors.grey140,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
