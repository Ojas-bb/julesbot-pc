import 'dart:io';
import 'package:system_tray/system_tray.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class TrayService {
  final SystemTray _systemTray = SystemTray();

  Future<void> init() async {
    String iconPath = Platform.isWindows ? 'assets/app_icon.ico' : 'assets/app_icon.png';

    await _systemTray.initSystemTray(
      title: "Jules Command Center",
      iconPath: iconPath,
    );

    final Menu menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(label: 'Show', onClicked: (menuItem) => appWindow.show()),
      MenuItemLabel(label: 'Hide', onClicked: (menuItem) => appWindow.hide()),
      MenuItemLabel(label: 'Exit', onClicked: (menuItem) => appWindow.close()),
    ]);

    await _systemTray.setContextMenu(menu);

    _systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? appWindow.show() : _systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? _systemTray.popUpContextMenu() : appWindow.show();
      }
    });
  }
}
