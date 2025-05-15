import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_event.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_state.dart';

import '../../../../core/config/config.dart';
import '../../domain/repositories/university_repository.dart';

class UniversityListBloc
    extends Bloc<UniversityListEvent, UniversityListState> {
  final UniversityRepository repo;
  UniversityListBloc({required this.repo})
    : super(UniversityListInitialState()) {
    on<UniversityListLoadDataEvent>(_loadDataList);
    on<UniversityListLoadMoreDataEvent>(_loadMoreDataList);
    on<UniversityListSearchEvent>(_searchDataList);
  }

  _loadDataList(event, emit) async {
    emit(UniversityListLoadingState());
    final offset = Config.offset;
    final limit = Config.limit;
    final response = await repo.search(limit: limit, offset: offset);
    if (response.success) {
      emit(
        UniversityListSuccessState(
          universities: response.data ?? [],          
          limit: limit,
          offset: offset,
        ),
      );
    } else {
      emit(UniversityListErrorState(errorCode: response.statusCode!, errorMessage : response.message!));
    }
  }

  _loadMoreDataList(event, emit) async {
    final currentState = state;
    if (currentState is UniversityListSuccessState) {
      final offset = currentState.offset + Config.limit;
      final response = await repo.search(
        keyword: currentState.keyword,
        country: currentState.country,
        limit: currentState.limit,
        offset: offset,
      );
      if (response.success) {
        currentState.universities.addAll(response.data!);
        emit(
          currentState.copyWith(
            universities: currentState.universities,
            offset: offset,
          ),
        );
      }
    }
  }

  _searchDataList(event, emit) async {
    emit(UniversityListLoadingState());
    final offset = Config.offset;
    final limit = Config.limit;
    final response = await repo.search(
      keyword: event.keyword,
      country: event.country,
      limit: limit,
      offset: offset,
    );
    if (response.success) {
      emit(
        UniversityListSuccessState(
          universities: response.data ?? [],
          keyword: event.keyword,
          country: event.country,
          limit: limit,
          offset: offset,
        ),
      );
    } else {
      emit(UniversityListErrorState(errorCode: response.statusCode!, errorMessage : response.message!));
    }

  }
}
