import 'package:peko_application/data/models/official_artwork.dart';

class Other {
  // DreamWorld? dreamWorld;
  // Home? home;
 final OfficialArtwork? officialArtwork;

 const Other({required this.officialArtwork});

 factory Other.fromJson(Map<String, dynamic> json) => Other(

    officialArtwork : json['official-artwork'] != null
        ? new OfficialArtwork.fromJson(json['official-artwork'])
        : null
 );


}
