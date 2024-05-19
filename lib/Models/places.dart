class PlaceModel {
  final int id;
  final String placeName;
  final String placeDescription;
  final String placeAddress;
  final double lat;
  final double lng;
  final int placeViews;
  final String placeCategory;
  final List<String> placeImgs;

  const PlaceModel(
      {required this.id,
      required this.placeName,
      required this.placeDescription,
      required this.placeAddress,
      required this.lat,
      required this.lng,
      required this.placeViews,
      required this.placeCategory,
      required this.placeImgs});

  factory PlaceModel.fromjsom(jsondata, imgs) {
    return PlaceModel(
      id: jsondata['id'],
      placeName: jsondata['place_name'],
      placeDescription: jsondata['place_description'],
      placeAddress: jsondata['place_address'],
      lat: double.parse(jsondata['place_latitude']),
      lng: double.parse(jsondata['place_longitude']),
      placeViews: jsondata['place_view'],
      placeCategory: jsondata['place_category']['category_title'],
      placeImgs: imgs,
    );
  }
}

const allPlaces = [
  PlaceModel(
    id: 0,
    placeName: 'curren_location',
    lat: 0,
    lng: 0,
    placeCategory: '',
    placeImgs: [],
    placeViews: 0,
    placeAddress: '',
    placeDescription: '',
  ),
  PlaceModel(
    id: 1,
    placeName: 'Ahgaff Univrsty',
    lat: 14.487095,
    lng: 49.043437,
    placeCategory: 'school',
    placeImgs: [],
    placeViews: 3,
    placeAddress: 'rr',
    placeDescription: 'll',
  ),
  PlaceModel(
      id: 2,
      placeName: 'Hadrmout Univrsty',
      lat: 14.4855732,
      lng: 49.0440754,
      placeCategory: 'dd',
      placeImgs: [],
      placeViews: 3,
      placeAddress: 'rr',
      placeDescription: 'll'),
  PlaceModel(
    id: 3,
    placeName: 'Pizza House',
    lat: 14.4892206,
    lng: 49.044188,
    placeCategory: 'dd',
    placeImgs: [],
    placeViews: 3,
    placeAddress: 'rr',
    placeDescription: 'll',
  ),
  PlaceModel(
    id: 4,
    placeName: 'Mukalla Mall',
    lat: 14.531313,
    lng: 49.121518,
    placeCategory: 'dd',
    placeImgs: [],
    placeViews: 3,
    placeAddress: 'rr',
    placeDescription: 'll',
  ),
  PlaceModel(
    id: 5,
    placeName: 'Al-Noor Hospital',
    lat: 14.490597,
    lng: 49.048542,
    placeCategory: 'hospital',
    placeImgs: [],
    placeViews: 3,
    placeAddress: 'rr',
    placeDescription: 'll',
  ),
];
