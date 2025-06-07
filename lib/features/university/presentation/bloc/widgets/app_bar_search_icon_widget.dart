import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/bloc/university_list_state.dart';

import '../bloc/university_list_bloc.dart';
import '../bloc/university_list_event.dart';

class AppBarSearchIconWidget extends StatelessWidget {
  const AppBarSearchIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UniversityListBloc, UniversityListState>(
      builder: (context, state) {
        return !state.isActiveSearch
            ? IconButton(
              onPressed: () {
                BlocProvider.of<UniversityListBloc>(
                  context,
                ).add(ActiveToggleSearchOnAppBarEvent(isActive: true));
              },
              icon: Icon(Icons.search),
            )
            : IconButton(
              onPressed: () {
                BlocProvider.of<UniversityListBloc>(
                  context,
                ).add(ResetDataEvent());
              },
              icon: Icon(Icons.close),
            );
      },
    );
  }
}
