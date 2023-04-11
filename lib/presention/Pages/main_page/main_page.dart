part of 'main_page_import.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<int> data = [1, 2, 3];
  double radius = 90.0;

  @override
  void initState() {
    // TODO: implement initState
    context.read<PekemonesBloc>().add(OnReloadChanged());
  }

  List<Widget> list() {
    final double firstItemAngle = 90;
    final double lastItemAngle = 120;
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
    return BlocBuilder<PekemonesBloc, PekemonesState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: DefaultAppBar(),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Res.bg),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      title: "Select Your",
                      size: 30,
                      fontWeight: FontWeight.w300,
                    ),
                    Row(
                      children: [
                        DefaultText(
                          title: "Pokèmon",
                          size: 40,
                          fontWeight: FontWeight.w600,
                        ),
                        Image.asset(
                          Res.pekemon,
                          width: 30,
                        )
                      ],
                    ),
                    state is PekemonesLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: Container(
                              //  color: Colors.amberAccent,
                              child: state is PekemonesHasData
                                  ? Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          padding: EdgeInsets.only(bottom: 50),
                                          height: double.infinity,
                                          child: DefaultText(
                                              // align: TextAlign.end,
                                              fontWeight: FontWeight.w400,
                                              size: 19,
                                              title:
                                                  "${state.result.length} Pokèmons\n in your\n Pokèdex"
                                                      .toString()),
                                        ),
                                        //    state.result.every((element) => )

                                        Expanded(
                                          child: Container(
                                            color: Colors.red,
                                            child: Stack(
                                              children: getStack(state.result),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(),
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> getStack(List<PekemonsModel> data) {
    List<Widget> widgetArray = [];

    double top = 20;
    for (int i = 0; (i < data.length && i < 5); i++) {
      widgetArray.add(Positioned(
        top: top,
        left: 100,
        height: 250,
        width: 250,
        child: Image.network(data[i].sprites!.frontDefault ?? ""),
      ));
      top = top + 20;
    }

    return widgetArray;
  }
}
