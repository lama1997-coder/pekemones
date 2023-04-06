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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          children: [
            Text(
              "Wellcome to Pekemon Gallery",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
