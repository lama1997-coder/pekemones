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


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PekemonesBloc, PekemonesState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: MyColors.black,
            appBar: DefaultAppBar(),
            body: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Res.bg),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
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

                                    CardWidget(result: state.result,)
                                    ],
                                  )
                                : Container(),
                          ),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  
}
