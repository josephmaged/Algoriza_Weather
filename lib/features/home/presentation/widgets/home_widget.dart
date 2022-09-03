import 'dart:ui';

import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ScrollController? _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController!.hasClients && _scrollController!.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                dateTime.hour >= 5 && dateTime.hour < 18 ? 'assets/images/day2.png' : 'assets/images/night2.png',
              ),
              fit: BoxFit.fill),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: isShrink ? Colors.black54 : Colors.transparent,
                  pinned: true,
                  expandedHeight: 200,
                  collapsedHeight: 80,
                  forceElevated: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "33",
                          ),
                          TextSpan(text: "\n"),
                          TextSpan(
                            text: "Giza",
                          )
                        ],
                      ),
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: const Padding(padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30
                    ),
                    child: Text('test')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
