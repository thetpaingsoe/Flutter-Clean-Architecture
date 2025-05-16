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
    final offset = Config.offset;
    final limit = Config.limit;
    final response = await searchUniversitiesUsercase.call(
      keyword: "",
      country: "",
      limit: limit,
      offset: offset,
    );
    if (response.success) {
      emit(
        state.copyWith(
          status: Status.loaded,
          universities: response.data ?? [],
          limit: limit,
          offset: offset,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: Status.error,
          errorCode: response.statusCode!,
          errorMessage: response.message!,
        ),
      );
    }
  }

  _activateActiveToggleForSearch(event, emit) async {
    emit(state.copyWith(isActiveSearch: event.isActive));
  }

  _loadDataList(event, emit) async {
    emit(UniversityListState(status: Status.initial));
    final offset = Config.offset;
    final limit = Config.limit;
    final response = await searchUniversitiesUsercase.call(
      keyword: "",
      country: "",
      limit: limit,
      offset: offset,
    );
    if (response.success) {
      emit(
        state.copyWith(
          status: Status.loaded,
          universities: response.data ?? [],
          limit: limit,
          offset: offset,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: Status.error,
          errorCode: response.statusCode!,
          errorMessage: response.message!,
        ),
      );
    }
  }

  _loadMoreDataList(event, emit) async {
    emit(state.copyWith(status: Status.loading));

    final offset = state.offset + Config.limit;
    final limit = Config.limit;
    final response = await searchUniversitiesUsercase.call(
      keyword: state.keyword ?? "",
      country: state.country ?? "",
      limit: limit,
      offset: offset,
    );
    if (response.success) {
      state.universities.addAll(response.data!);
      emit(
        state.copyWith(
          universities: state.universities,
          status: Status.loaded,
          limit: limit,
          offset: offset,
        ),
      );
    }
  }

  _searchDataList(event, emit) async {
    final offset = Config.offset;
    final limit = Config.limit;
    final response = await searchUniversitiesUsercase.call(
      keyword: event.keyword,
      country: event.country,
      limit: limit,
      offset: offset,
    );
    if (response.success) {
      emit(
        state.copyWith(
          keyword: event.keyword,
          country: event.country,
          status: Status.loaded,
          universities: response.data ?? [],
          limit: limit,
          offset: offset,
        ),
      );
    } else {
      emit(
        state.copyWith(
          keyword: "",
          country: "",
          status: Status.error,
          errorCode: response.statusCode!,
          errorMessage: response.message!,
        ),
      );
    }
  }
}
