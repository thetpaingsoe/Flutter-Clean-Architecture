import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_event.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_state.dart';

import '../../domain/repositories/university_repository.dart';

class UniversityListBloc extends Bloc<UniversityListEvent, UniversityListState> {

  UniversityListBloc({required UniversityRepository repo})  :super(UniversityListInitialState(universities: [])) {
    on<UniversityListSearchEvent>((event, emit) async{
      final universities = await repo.search('','',10,0);
      emit(UniversityListInitialState(universities: universities));
    });
  }


}