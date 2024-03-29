import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multistore_app/minor_screen/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 1.4),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'What are you looking for?',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                            height: 32,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Search',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                      ],
                    )),
              ),
              bottom: const TabBar(
                isScrollable: true,
                indicatorColor: Colors.yellow,
                indicatorWeight: 8,
                tabs: [
                  RepeatedTab(
                    label: 'Men',
                  ),
                  RepeatedTab(
                    label: 'Women',
                  ),
                  RepeatedTab(
                    label: 'Shoes',
                  ),
                  RepeatedTab(
                    label: 'Bags',
                  ),
                  RepeatedTab(
                    label: 'Electronics',
                  ),
                  RepeatedTab(
                    label: 'Accessories',
                  ),
                  RepeatedTab(
                    label: 'Home & Garden',
                  ),
                  RepeatedTab(
                    label: 'Kids',
                  ),
                  RepeatedTab(
                    label: 'Beauty',
                  ),
                ],
              )),
          body: const TabBarView(children: [
            Center(child: Text('Men Screen')),
            Center(child: Text('Women Screen')),
            Center(child: Text('Shoes Screen')),
            Center(child: Text('Bags Screen')),
            Center(child: Text('Electronics Screen')),
            Center(child: Text('Accessories Screen')),
            Center(child: Text('Home & Garden Screen')),
            Center(child: Text('Kids Screen')),
            Center(child: Text('Beauty Screen')),
          ])),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
