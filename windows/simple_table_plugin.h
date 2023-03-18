#ifndef FLUTTER_PLUGIN_SIMPLE_TABLE_PLUGIN_H_
#define FLUTTER_PLUGIN_SIMPLE_TABLE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace simple_table {

class SimpleTablePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SimpleTablePlugin();

  virtual ~SimpleTablePlugin();

  // Disallow copy and assign.
  SimpleTablePlugin(const SimpleTablePlugin&) = delete;
  SimpleTablePlugin& operator=(const SimpleTablePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace simple_table

#endif  // FLUTTER_PLUGIN_SIMPLE_TABLE_PLUGIN_H_
