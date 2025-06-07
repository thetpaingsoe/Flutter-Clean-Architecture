import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/bloc/university_list_bloc.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/bloc/university_list_event.dart';
import 'package:flutter_clean_architecture/features/university/presentation/bloc/bloc/university_list_state.dart';

class AppBarTitleWidget extends StatelessWidget {
  AppBarTitleWidget({super.key, required this.title});

  final String title;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UniversityListBloc, UniversityListState>(
      builder: (context, state) {
        if (state.isActiveSearch) {
          return TextField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter Search Keyword',
              hintStyle: TextStyle(color: Theme.of(context).highlightColor),
            ),
            textInputAction: TextInputAction.search,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            onChanged: (value) {
              BlocProvider.of<UniversityListBloc>(context).add(
                UniversityListSearchEvent(
                  keyword: controller.text,
                  country: "",
                ),
              );
            },
          );
        } else {
          controller.text = "";
        }
        return Text(title);
      },
    );
  }
}
