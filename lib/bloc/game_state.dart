part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}


class GameInitialLoading  extends GameState {}


class GameInitialLoaded extends GameState {
  final List<DataModel> apiResult;
  GameInitialLoaded({
    required this.apiResult,
  });


  
  
  
  
  }


class GameErorr  extends GameState {}