import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowadays/layout/news_app/cubit/cubit.dart';
import 'package:nowadays/layout/news_app/cubit/states.dart';
import 'package:nowadays/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list= NewsCubit.get(context).business;
        return ConditionalBuilder(
            condition: state is! NewsGetBusinessLoadingState,
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
