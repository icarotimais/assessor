import 'package:assessorapp/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool _isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 640.0;
}

/// See bottomNavigationBarItem or NavigationRailDestination
class AdaptiveScaffoldDestination {
  final String title;
  final IconData icon;
  final Function onTapDestination;

  const AdaptiveScaffoldDestination(
      {@required this.title,
      @required this.icon,
      @required this.onTapDestination});
}

/// A widget that adapts to the current display size, displaying a [Drawer],
/// [NavigationRail], or [BottomNavigationBar]. Navigation destinations are
/// defined in the [destinations] parameter.
class AdaptiveScaffold extends StatefulWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget body;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  final FloatingActionButton floatingActionButton;
  final bool isAltheticated;

  AdaptiveScaffold(
      {this.title,
      this.body,
      this.actions = const [],
      this.destinations,
      this.onNavigationIndexChange,
      this.floatingActionButton,
      this.isAltheticated});

  @override
  _AdaptiveScaffoldState createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  final MenuController menuController = Get.find<MenuController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show a Drawer
    if (_isLargeScreen(context)) {
      return Obx(() => Row(
            children: [
              !menuController.isAuthenticated.value
                  ? Container()
                  : Container(
                      width: (MediaQuery.of(context).size.width / 100) * 20,
                      child: Drawer(
                        child: Column(
                          children: [
                            DrawerHeader(
                              child: Center(
                                child: widget.title,
                              ),
                            ),
                            for (var d in widget.destinations)
                              ListTile(
                                leading: Icon(d.icon),
                                title: Text(d.title),
                                onTap: d.onTapDestination,
                              ),
                          ],
                        ),
                      ),
                    ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: Colors.grey[300],
              ),
              Expanded(
                child: Scaffold(
                  appBar: !menuController.isAuthenticated.value
                      ? null
                      : AppBar(
                          actions: widget.actions,
                          title: Text(
                            menuController.paginaSelecionada.value,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          centerTitle: true,
                        ),
                  body: widget.body,
                  floatingActionButton: widget.floatingActionButton,
                ),
              )
            ],
          ));
    } else {
      return Obx(() => Scaffold(
            appBar: !menuController.isAuthenticated.value
                ? null
                : AppBar(
                    actions: widget.actions,
                    title: Text(
                      menuController.paginaSelecionada.value,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                    leading: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                  ),
            drawer: Builder(
              builder: (context) => Drawer(
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Center(
                        child: widget.title,
                      ),
                    ),
                    for (var d in widget.destinations)
                      ListTile(
                        leading: Icon(d.icon),
                        title: Text(d.title),
                        onTap: () {
                          d.onTapDestination();
                          Scaffold.of(context).openEndDrawer();
                        },
                      ),
                  ],
                ),
              ),
            ),
            body: widget.body,
            floatingActionButton: widget.floatingActionButton,
            drawerEnableOpenDragGesture: false,
          ));
    }
  }
}
