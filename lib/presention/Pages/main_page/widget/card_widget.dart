part of 'widget_import.dart';

class CardWidget extends StatelessWidget {
  final List<PekemonsModel>? result;
  const CardWidget({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        alignment: Alignment.topRight,
        children: getStack(result ?? [], context),
      ),
    );
  }

  List<Widget> getStack(List<PekemonsModel> data, BuildContext context) {
    List<Map<String, dynamic>> images = [
      {"image": 'asset/images/green.png', "color": MyColors.green},
      {"image": 'asset/images/water.png', "color": MyColors.sky},
      {"image": 'asset/images/fire.png', "color": MyColors.yellow}
    ];
    List<Widget> widgetArray = [];

    double top = 50;
    int rotate = 1;
    for (int i = 0; (i < data.length && i < 3); i++) {
      print("the color${images[i]['color']}");
      if (i % 2 != 0) rotate = -1 * rotate;
      Animation<double> turns() => i % 2 == 0
          ? new AlwaysStoppedAnimation(15 / (rotate * 360))
          : new AlwaysStoppedAnimation(1);
      widgetArray.add(Positioned(
        top: top,
        child: InkWell(
          onTap: () {
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          backgroundColor: images[i]['color'].withOpacity(1.0),
                          backgroundImage: images[i]['image'],
                          pekemonsModel: result![i],
                        )),
              );
            }
          },
          child: RotationTransition(
            turns: turns(),
            // i % 2 == 0
            //     ? new AlwaysStoppedAnimation(15 / -360)
            //     : new AlwaysStoppedAnimation(1),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[i]['image']),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: images[i]['color'].withOpacity(1.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -70,
                  right: 0,
                  child: Image.network(
                    data[i].sprites?.other!.officialArtwork!.frontDefault ?? "",
                    width: MediaQuery.of(context).size.width / 2.2,
                    //height: 100,
                  ),
                ),
                Positioned(
                  top: 120,
                  child: Column(
                    children: [
                      DefaultText(
                        title: data[i].name!.toUpperCase() ?? "null",
                        fontWeight: FontWeight.w500,
                        size: 20,
                        color: MyColors.primary2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
      top = top + 120;
    }

    return widgetArray;
  }
}
