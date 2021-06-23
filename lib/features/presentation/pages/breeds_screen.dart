import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/navigation.dart';
import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_app/features/domain/entities/breeds_information_entity.dart';
import 'package:flutter_app/features/presentation/BreedsEvent.dart';
import 'package:flutter_app/features/presentation/BreedsState.dart';
import 'package:flutter_app/features/presentation/breeds_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
class BreedsScreen extends StatefulWidget {
  static const String routeName = '/breeds_screen';

  BreedsScreen({Key key}) : super(key: key);

  @override
  _BreedsScreenState createState() => _BreedsScreenState();
}

class _BreedsScreenState extends State<BreedsScreen> {
  List<BreedsInformationEntity> listofBeeds = [];

  @override
  void initState() {
    BlocProvider.of<BreedsBloc>(context).add(BreedEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BreedsBloc, BreedsState>(
        listener: (context, state) {
          if (state is ErrorState &&
              state.message != null &&
              state.message.isNotEmpty) {
            Utils.showErrorToast(state.message, context);
            Navigation.back(context);
          } else if (state is LoadingState) {
            Utils.showProgressDialog(context);
          } else if (state is LoadedState) {
            Navigation.back(context);
            listofBeeds.clear();
            setState(() {
              listofBeeds.addAll(state.breedsInformationEntity);
            });
          }
        },
        builder: (context, state) {
          return Container(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  var data = listofBeeds[index];
                  return Container(
                    height: 100.0,
                    child: Card(
                      margin: EdgeInsets.all(6.0),
                      elevation: 3.0,
                      child: Row(
                        children: [
                          Image.network(
                            data.imageURL,
                            fit: BoxFit.contain,
                          ),
                          Text("${data.name}"),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1.0,
                  );
                },
                itemCount: listofBeeds.length),
          );
        },
      ),
    );
  }
}
