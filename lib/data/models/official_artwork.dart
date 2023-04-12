class OfficialArtwork {
 final String? frontDefault;

const  OfficialArtwork({required this.frontDefault});

 factory OfficialArtwork.fromJson(Map<String, dynamic> json)=> OfficialArtwork(
    frontDefault : json['front_default']
 );


}