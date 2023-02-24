package com.licl.stroage;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** StroagePlugin */
public class StroagePlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private SharedPreferences preferences;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "stroage");
    channel.setMethodCallHandler(this);
    preferences=flutterPluginBinding.getApplicationContext().getSharedPreferences("LiclSharedPreferences", Context.MODE_PRIVATE);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method){
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;
      case "get":{
        result.success("Android " + preferences.getString(call.argument("key"),"安卓中没有数据"));
        break;
      }
      case "set":{
        SharedPreferences.Editor editor = preferences.edit();
        editor.putString(call.argument("key"), call.argument("value"));
        editor.commit();
        result.success("Android set 设置成功" );
        break;
      }
      default:
        result.notImplemented();
        break;
    }


  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding activityPluginBinding) {

  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding activityPluginBinding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }
}
