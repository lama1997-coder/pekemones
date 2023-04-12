part of 'detail_page_import.dart';

class DetailPage extends StatelessWidget {
  final String? backgroundImage;
  final Color? backgroundColor;
  final PekemonsModel? pekemonsModel;
  const DetailPage(
      {super.key,
      this.backgroundImage,
      this.backgroundColor,
      this.pekemonsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      appBar: DefaultAppBar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage ?? ""),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            child: Image.network(
                pekemonsModel?.sprites?.other!.officialArtwork!.frontDefault ??
                    ""),
          ),
          DefaultText(
            title: pekemonsModel!.name ?? "",
            size: 35,
          )
        ],
      ),
    );
  }
}
