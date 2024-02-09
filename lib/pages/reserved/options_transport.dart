import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/reserved/title_options_transport.dart';

class OptionsTransportPage extends StatelessWidget {
  const OptionsTransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TitleOptionsTransport(),
          toolbarHeight: 80,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            labelColor: ColorConstants.greenDarkAppColor,
            indicatorColor: ColorConstants.greenDarkAppColor,
            tabs: const <Widget>[
              Tab(
                child: Column(
                  children: [Text('Aller'), Text('21/02/2023')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Retour'), Text('21/02/2023')],
                ),
              ),
            ],
          ),
          backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('Aller'),
            NestedTabBar('Retour'),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          dividerColor: Colors.transparent,
          labelColor: ColorConstants.greenDarkAppColor,
          indicatorColor: ColorConstants.greenDarkAppColor,
          tabs: const <Widget>[
            Tab(text: '🚅 Train'),
            Tab(text: '🚌 Bus'),
            Tab(text: '🚗 Covoit`'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text('${widget.outerTab}: Train'),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text('${widget.outerTab}: bus'),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text('${widget.outerTab}: covoit'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
