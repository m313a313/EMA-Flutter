class ComplaintsModel {
  final int id;
  final String placeName;
  final String descruption;
  final String text;
  final String imgUrl;
  final bool? isFav;
  final DateTime? createdAt;

  const ComplaintsModel(
      {required this.id,
      required this.placeName,
      required this.descruption,
      required this.imgUrl,
      required this.text,
      this.isFav = false,
      this.createdAt});
}

const allComplaints = [
  ComplaintsModel(
      id: 1,
      placeName: 'paceName1',
      descruption: 'descruption1 descruption1 descruption1 descrup',
      text:
          'Im Hassan alidroos from yemen i love Palestine , Free Palsetine , hahhaha',
      imgUrl: 'images/logo.png'),
  ComplaintsModel(
      id: 2,
      placeName: 'paceName2',
      descruption: 'descruption2',
      text:
          '2Im Hassan alidroos from yemen i love Palestine , Free Palsetine , hahhaha',
      isFav: true,
      imgUrl: 'images/logo.png'),
  ComplaintsModel(
      id: 3,
      placeName: 'paceName3',
      descruption: 'descruption3',
      text:
          '3Im Hassan alidroos from yemen i love Palestine , Free Palsetine , hahhaha',
      imgUrl: 'images/logo.png'),
  ComplaintsModel(
      id: 4,
      placeName: 'paceName4',
      descruption: 'descruption4',
      text:
          '4Im Hassan alidroos from yemen i love Palestine , Free Palsetine , hahhaha',
      isFav: true,
      imgUrl: 'images/logo.png'),
];
