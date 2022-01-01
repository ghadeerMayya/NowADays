import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list= NewsCubit.get(context).sports;
        return ConditionalBuilder(
            condition: list.length>0,
            builder: (context) =>
                ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index)=>buildArticleItem(list[index]),
                    separatorBuilder: (context, index)=>myDivider(),
                    itemCount: 10),
            fallback: (context) => const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
