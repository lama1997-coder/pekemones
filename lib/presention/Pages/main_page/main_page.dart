part of 'main_page_import.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<PekemonesBloc>().add(OnReloadChanged());
  }

  List<int> data = [1, 2, 3];

  double radius = 180.0;

  List<Widget> list() {
    final double firstItemAngle = pi;
    final double lastItemAngle = pi;
    final double angleDiff = (firstItemAngle + lastItemAngle) / 3;
    double currentAngle = firstItemAngle;

    return data.map((int index) {
      print(pi);
      currentAngle += angleDiff;
      return _radialListItem(currentAngle, index);
    }).toList();
  }

  Widget _radialListItem(double angle, int index) {
    final x = cos(angle) * radius;
    final y = sin(angle) * radius;
    print("the angle " + x.toString() + "______" + y.toString());

    return Container(
      // color: Colors.amber,
      alignment: Alignment.centerRight,
      child: Transform(
          transform: index == 1
              ? Matrix4.translationValues(0.0, 0.0, 0.0)
              : Matrix4.translationValues(x, y, 0.0),
          child: InkWell(
            onTap: () {
              print(index.toString());
            },
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("images/c1.jpeg"),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: new Stack(children: list()),
      ),
    );
  }
}
