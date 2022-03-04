import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:series_app/models/data_model.dart';
import 'package:series_app/repository/game_api_services.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {

  final GameApi? gameApi;
  GameBloc(
    this.gameApi,
  ) : super(GameInitial()) {
    on<GameEvent>((event, emit) async{
    
    
      if(event is LoadGameEvent)
      {
        emit(GameInitialLoading());
        List<DataModel>?  apiResult= await gameApi!.getGamesData();
       if(apiResult==null){
         emit(GameErorr());
       }
       else
       {
         emit(GameInitialLoaded(apiResult: apiResult));
       }

      }

        });
  }
}
