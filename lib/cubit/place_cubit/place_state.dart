part of 'place_cubit.dart';

sealed class PlaceState {}

final class PlaceInitial extends PlaceState {}
class PlaceInfoLoadSucces extends PlaceState{}
class PlaceInfoLoadFaild extends PlaceState{}
class PlaceInfoLoadaing extends PlaceState{}
