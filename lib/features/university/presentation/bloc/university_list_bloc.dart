import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/university/domain/usecases/search_universities_usecase.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_event.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_state.dart';
import '../../../../core/config/config.dart';
import '../../../../core/config/constants.dart';

class UniversityListBloc
    extends Bloc<UniversityListEvent, UniversityListState> {
  final SearchUniversitiesUsercase searchUniversitiesUsercase;
  UniversityListBloc({required this.searchUniversitiesUsercase})
    : super(UniversityListState()) {
    on<UniversityListLoadDataEvent>(_loadDataList);
    on<UniversityListLoadMoreDataEvent>(_loadMoreDataList);
    on<UniversityListSearchEvent>(_searchDataList);
    on<ResetDataEvent>(_resetData);

    // Handling Appbar Keyword Search
    on<ActiveToggleSearchOnAppBarEvent>(_activateActiveToggleForSearch);
  }

  _resetData(event, emit) async {
    emit(UniversityListState(status: Status.initial));
    
    // Prepare Params
    final params = state.params.copyWith(
      offset: Config.offset,
      limit: Config.limit,
    );
    final response = await searchUniversitiesUsercase.call(params: params);
    if (response.success) {
      emit(
        state.copyWith(
          status: Status.loaded,
          universities: response.data ?? [],
          params: params,          
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: Status.error,
          errorCode: response.statusCode!,
          errorMessage: response.message!,
          params: params,
        ),
      );
    }
  }

  _activateActiveToggleForSearch(event, emit) async {
    emit(state.copyWith(isActiveSearch: event.isActive));
  }

  _loadDataList(event, emit) async {
    emit(UniversityListState(status: Status.initial));
    
    // Prepare Params
    final params = state.params.copyWith(
      offset: Config.offset,
      limit: Config.limit,
    );

    final response = await searchUniversitiesUsercase.call(
      params: params,
    );
    if (response.success) {
      emit(
        state.copyWith(
          status: Status.loaded,
          universities: response.data ?? [],
          params: params,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: Status.error,
          errorCode: response.statusCode!,
          errorMessage: response.message!,
          params: params,
        ),
      );
    }
  }

  _loadMoreDataList(event, emit) async {
    emit(state.copyWith(status: Status.loading));

    // Prepare Params
    final params = state.params.copyWith(
      offset: state.params.offset + Config.limit,
    );
    final response = await searchUniversitiesUsercase.call(
      params: params,      
    );
    if (response.success) {
      state.universities.addAll(response.data!);
      emit(
        state.copyWith(
          universities: state.universities,
          status: Status.loaded,
          params: params,
        ),
      );
    }
  }

  _searchDataList(event, emit) async {
    
    // Prepare Params
    final params = state.params.copyWith(
      keyword: event.keyword,
      country: event.country,
      limit: Config.limit,
      offset: Config.offset,
    );
    final response = await searchUniversitiesUsercase.call(
      params: params,
    );
    if (response.success) {
      emit(
        state.copyWith(
          status: Status.loaded,
          universities: response.data ?? [],
          params: params,          
        ),
      );
    } else {
      emit(
        state.copyWith(
          params: params,
          status: Status.error,
          errorCode: response.statusCode!,
          errorMessage: response.message!,
        ),
      );
    }
  }
}
