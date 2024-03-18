
class OffersModel {
  final int id;
  final String text;
  final String imgUrl;
  final int? likedNum;
  final int? disLikedNum;

  const OffersModel(
      {required this.id,
      required this.text,
      required this.imgUrl,
      this.likedNum,
      this.disLikedNum});
}

const allOffers = [
  OffersModel(
      id: 1,
      text:
          'askldmn flwkfw fm ekrjm fop mff  ffm e.lgfjek fwkejfwe ffwelkfwe f fwkfwefw fwi  fwf wfinwf fwfwf wfwmfowfn w d wfiwf w fw mfwiofnwfwfnwf w fc wvhs,fw',
      imgUrl: 'images/ad.jpg'),
OffersModel(
      id: 2,
      text:
          'askldmn flwkfw fm ekrjm fop mff  ffm e.lgfjek fwkejfwe ffwelkfwe f fwkfwefw fwi  fwf wfinwf fwfwf wfwmfowfn w d wfiwf w fw mfwiofnwfwfnwf w fc wvhs,fw',
      imgUrl: 'images/ad.jpg'),
OffersModel(
      id: 3,
      text:
          'askldmn flwkfw fm ekrjm fop mff  ffm e.lgfjek fwkejfwe ffwelkfwe f fwkfwefw fwi  fwf wfinwf fwfwf wfwmfowfn w d wfiwf w fw mfwiofnwfwfnwf w fc wvhs,fw',
      imgUrl: 'images/ad.jpg'),
OffersModel(
      id: 4,
      text:
          'askldmn flwkfw fm ekrjm fop mff  ffm e.lgfjek fwkejfwe ffwelkfwe f fwkfwefw fwi  fwf wfinwf fwfwf wfwmfowfn w d wfiwf w fw mfwiofnwfwfnwf w fc wvhs,fw',
      imgUrl: 'images/ad.jpg')
];
