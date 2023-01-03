import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc_template/presentation/common_widgets/sb_error.dart';
import 'package:flutter_bloc_template/presentation/common_widgets/wg_error.dart';
import 'package:flutter_bloc_template/presentation/screen/map/bloc_user_position/bloc.dart';
import 'package:flutter_bloc_template/presentation/screen/map/widget/wg_map_container.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late Position position;

  @override
  Widget build(BuildContext context) {
    return _buildScreenMap(context);
  }

  Scaffold _buildScreenMap(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: BlocListener<UserPositionBloc, UserPositionState>(
            listener: (context, state) {
              if (state is UserPositionError) {
                SbError().show(context);
              }
            },
            child: BlocProvider(
              create: (_) =>
                  BlocProvider.of<UserPositionBloc>(context)..add(GetUserPosition()),
              child: _blocBuilder(),
            ),
          )),
    );
  }

  BlocBuilder<UserPositionBloc, UserPositionState> _blocBuilder() =>
      BlocBuilder<UserPositionBloc, UserPositionState>(
        builder: (context, state) {
          if (state is UserPositionLoaded) {
            return Column(
              children: [
                Expanded(
                  child: MapContainer(userPosition: state.userPosition),
                ),
              ],
            );
          } else {
            return ErrorScreen(state: state);
          }
        },
      );
}
