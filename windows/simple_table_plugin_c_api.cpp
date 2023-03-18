#include "include/simple_table/simple_table_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "simple_table_plugin.h"

void SimpleTablePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  simple_table::SimpleTablePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
