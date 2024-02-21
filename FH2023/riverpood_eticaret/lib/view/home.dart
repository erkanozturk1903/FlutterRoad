// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpood_eticaret/components/custom_appbar.dart';
import 'package:riverpood_eticaret/riverpood/home_riverpod.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeRiverpod());

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(homeProvider);
    var read = ref.read(homeProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 210,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: read.pageController,
                    itemCount: read.campaigns.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        watch.campaigns[index],
                        fit: BoxFit.cover,
                      );
                    },
                    onPageChanged: (newPageValue) =>
                        read.setCampaignsCurrentIndex(newPageValue),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int i = 0; i < watch.campaigns.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: watch.campaignsCurrentIndex == i
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
