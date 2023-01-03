import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_template/data/repository/home_repository.dart';
import 'package:flutter_bloc_template/presentation/screen/home/bloc/bloc.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
  }

}
