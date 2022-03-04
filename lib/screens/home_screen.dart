
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:series_app/bloc/game_bloc.dart';
import 'package:series_app/models/data_model.dart';
import 'package:series_app/screens/detailes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game App"),),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (BuildContext context, state) {
          if (state is GameInitial) {
            context.read<GameBloc>().add(LoadGameEvent());
            
            return Center(child: const CircularProgressIndicator());
          } else if (state is GameInitialLoading) {
            return Center(child: const CircularProgressIndicator());
          } else if (state is GameInitialLoaded) {
            return GameModelUi(state.apiResult);
          } else if (state is GameErorr) {
            return Center(child: Text("Uh oh! 😭 Something went wrong!"));
          } else {
            return Center(child: Text("Uh oh! 😭 Something went wrong!"));
          }
        },
      ),
    );
  }
}

Widget GameModelUi(List<DataModel> apiresult) {
  return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: apiresult.length,
    itemBuilder: (BuildContext context, int index) {
      final DataModel dataModel = apiresult[index];
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: InkWell(
          onTap: () {
            
           Navigator.of(context).push(
             MaterialPageRoute(builder: (context)=> DetailsPage(dataModel: dataModel))
           );
          },
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    height: 230,
                    width: MediaQuery.of(context).size.width / 1.05,
                    fit: BoxFit.cover,
                    image: NetworkImage(dataModel.image),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width / 1.05,
                    height: 120,
                    border: 0,
                    borderRadius: 0,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.1),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: [0.1, 1],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              dataModel.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "PlatForms:" + dataModel.platforms,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
