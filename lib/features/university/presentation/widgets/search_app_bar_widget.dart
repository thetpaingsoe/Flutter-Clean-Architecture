
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/university_list_bloc.dart';
import '../bloc/university_list_event.dart';

class SeachAppBarWidget extends StatelessWidget {
  const SeachAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<UniversityListBloc>(
          context,
        ).add(UniversityListSearchEvent(keyword: "", country: "Poland"));
      },
      icon: Icon(Icons.search),
    );
  }
}