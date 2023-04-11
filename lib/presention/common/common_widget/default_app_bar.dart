part of 'widget_import.dart';
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      leadingWidth: 100,
      leading: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: MyColors.primary2),
        child: Icon(
          Icons.arrow_back_ios,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [Image.asset(Res.appbar)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
