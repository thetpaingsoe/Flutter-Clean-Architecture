import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_event.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_state.dart';

import '../../domain/repositories/university_repository.dart';

class UniversityListBloc extends Bloc<UniversityListEvent, UniversityListState> {

  UniversityListBloc({required UniversityRepository repo})  :super(UniversityListInitialState()) {
    on<UniversityListSearchEvent>((event, emit) async{
      emit(UniversityListLoadingState());
      await Future.delayed(Duration(seconds: 2));
      final response = await repo.search(event.keyword, event.country,0,50);
      if(response.success) {
        emit(UniversityListSuccessState(universities: response.data!));
      }else {
        emit(UniversityListErrorState(errorMessage: "No Data"));
      }
    });
    
  }


}