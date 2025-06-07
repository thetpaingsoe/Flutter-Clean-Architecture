import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/country/domain/usecases/get_all_country_usecase.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/params/search_university_params.dart';
import 'package:flutter_clean_architecture/features/university/domain/usecases/search_universities_usecase.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/bloc/university_list_event.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/bloc/university_list_state.dart';
import '../../../../../core/config/config.dart';
import '../../../../../core/config/constants.dart';

class UniversityListBloc
    extends Bloc<UniversityListEvent, UniversityListState> {
  final SearchUniversitiesUsercase searchUniversitiesUsercase;
  final GetAllCountryUsecase getAllCountryUsecase;

  UniversityListBloc({
    required this.searchUniversitiesUsercase,
    required this.getAllCountryUsecase,
  }) : super(const UniversityListState(status: Status.initial)) {
    on<UniversityListLoadDataEvent>(_onLoadData);
    on<UniversityListLoadMoreDataEvent>(_onLoadMore);
    on<UniversityListSearchEvent>(_onSearch);
    on<ResetDataEvent>(_onReset);
    on<ActiveToggleSearchOnAppBarEvent>(
      (event, emit) => emit(state.copyWith(isActiveSearch: event.isActive)),
    );
  }

  Future<void> _onReset(
    ResetDataEvent event,
    Emitter<UniversityListState> emit,
  ) async {
    final newParams = state.params.copyWith(
      keyword: "",
      offset: Config.offset,
      limit: Config.limit,
    );
    await _loadUniversities(emit, newParams, reset: true);
  }

  Future<void> _onLoadData(
    UniversityListLoadDataEvent event,
    Emitter<UniversityListState> emit,
  ) async {
    final params = state.params.copyWith(
      offset: Config.offset,
      limit: Config.limit,
    );
    await _loadUniversities(emit, params);
  }

  Future<void> _onLoadMore(
    UniversityListLoadMoreDataEvent event,
    Emitter<UniversityListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    final params = state.params.copyWith(
      offset: state.params.offset + Config.limit,
    );
    final response = await searchUniversitiesUsercase.call(params: params);

    if (response.success) {
      final updatedList = List.of(state.universities)
        ..addAll(response.data ?? []);
      emit(
        state.copyWith(
          universities: updatedList,
          status: Status.loaded,
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

  Future<void> _onSearch(
    UniversityListSearchEvent event,
    Emitter<UniversityListState> emit,
  ) async {

    final currentCountry = state.params.country;

    // Since we added the All condition in country, 
    // we have to make sure the correct country is selected.
    // That means we don't always on event, 
    // We will also check the data from state to keep the current country
    final newCountry = switch (event.country) {
      "All" => "",
      "" => currentCountry,
      _ => event.country,
    };

    final isSameCountry = newCountry == currentCountry;

    // If country is not same, reset keyword and call reset
    final keyword = isSameCountry ? event.keyword : "";
    final isReset = !isSameCountry;

    final params = state.params.copyWith(
      keyword: keyword,
      country: newCountry,
      offset: Config.offset,
      limit: Config.limit,
    );

    await _loadUniversities(emit, params, reset: isReset);
  }

  Future<void> _loadUniversities(
    Emitter<UniversityListState> emit,
    SearchUniversityParams params, {
    bool reset = false,
  }) async {
    emit(state.copyWith(status: Status.loading, params: params));

    final countries = await getAllCountryUsecase.call();
    final response = await searchUniversitiesUsercase.call(params: params);

    if (response.success) {
      emit(
        state.copyWith(
          status: Status.loaded,
          universities: response.data ?? [],
          params: params,
          countries: countries,
          isActiveSearch: reset ? false : state.isActiveSearch,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: Status.error,
          errorCode: response.statusCode!,
          errorMessage: response.message!,
          params: params,
          countries: countries,
        ),
      );
    }
  }
}
