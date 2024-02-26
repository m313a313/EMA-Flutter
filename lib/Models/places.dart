class Places {
  final int id;
  final String placeName;
  final double lat;
  final double lng;

  const Places(
      {required this.id,
      required this.placeName,
      required this.lat,
      required this.lng});
}

const allPlaces = [
  Places(id: 1, placeName: 'Ahgaff Univrsty', lat: 14.487095, lng: 49.043437),
  Places(
      id: 2, placeName: 'Hadrmout Univrsty', lat: 14.4855732, lng: 49.0440754),
  Places(id: 3, placeName: 'Pizza House', lat: 14.4892206, lng: 49.044188),
  Places(id: 4, placeName: 'Mukalla Mall', lat: 14.531313, lng: 49.121518),
];
