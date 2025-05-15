import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/config/constants.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_bloc.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/university_list_event.dart';
import 'package:flutter_clean_architecture/features/university/presentation/widgets/app_bar_search_icon_widget.dart';
import 'package:flutter_clean_architecture/features/university/presentation/widgets/app_bar_title_widget.dart';

import '../../../../core/di/injections.dart';
import '../bloc/university_list_state.dart';

/// --------------------------------------------------------------
/// Page
/// --------------------------------------------------------------
class UniversityListPage extends StatelessWidget {
  const UniversityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UniversityListBloc(searchUniversitiesUsercase: di.get()),
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitleWidget(title: "Flutter Clean Architecture"),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          actions: [
            AppBarSearchIconWidget(),
          ],
        ),
        body: UniversityListScreen(),
      ),
    );
  }
}

/// --------------------------------------------------------------
/// Screen
/// --------------------------------------------------------------
class UniversityListScreen extends StatefulWidget {
  const UniversityListScreen({super.key});

  @override
  State<UniversityListScreen> createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen> {
  
  @override
  void initState() {
    super.initState();
    // Dispatch initial event ONCE when the screen loads
    BlocProvider.of<UniversityListBloc>(
      context,
    ).add(UniversityListLoadDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UniversityListBloc, UniversityListState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == Status.loaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                final metrics = notification.metrics;
                if (metrics.atEdge && metrics.pixels != 0) {
                  // Hit the end of the list
                  BlocProvider.of<UniversityListBloc>(
                    context,
                  ).add(UniversityListLoadMoreDataEvent());
                }
              }
              return false;
            },
            child: ListView.builder(
              itemCount: state.universities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${state.universities[index].name} ( ${state.universities[index].country} ) ',
                  ),
                );
              },
            ),
          );
        } else if (state.status == Status.error) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
