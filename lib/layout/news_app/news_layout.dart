import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowadays/layout/news_app/cubit/cubit.dart';
import 'package:nowadays/layout/news_app/cubit/states.dart';
import 'package:nowadays/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(

            appBar: AppBar(
              title: const Text('NowADays'),
              actions: [IconButton(onPressed: () {},
                  icon: const Icon(Icons.search))],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
