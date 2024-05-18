// ignore_for_file: dead_code

import 'package:dio/dio.dart';
import 'package:ema/Models/places.dart';
import 'package:ema/cubit/place_cubit/place_state.dart';
import 'package:ema/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceCubit extends Cubit<PlaceState> {
  PlaceCubit() : super(PlaceInitial());
  Dio dio = Dio();
  List<PlaceModel> allPlaces = [];
  Future<List<PlaceModel>> fetchAllPlaces() async {
    print('$state rrrrr');
return [];

    emit(PlaceInfoLoadaing());

    try {
      Response response = await dio.get('$baseUrl/api/places');
      Map<String, dynamic> jsondata = response.data;
      List<dynamic> pl = jsondata['data'];
      for (var i = 0; i < pl.length; i++) {
        List<String> imgs = [];
        List<dynamic> imges = pl[i]['Place\'s Images'];

        for (var j = 0; j < imges.length; j++) {
          imgs.add(pl[i]['Place\'s Images'][j]['Image']);
        }

        PlaceModel place = PlaceModel.fromjsom(pl[i], imgs);

        print('ggggggn${place.placeName}');
        allPlaces.add(place);
      }
      emit(PlaceInfoLoadSucces());
      print('ffffffffm');

      return allPlaces;
    } on DioException catch (ex) {
      print(ex);
      emit(PlaceInfoLoadFaild());
      return [];
      // TODO
    }
  }
}
