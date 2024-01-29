package com.fluttermodulern;

import android.content.Context;

import com.facebook.react.bridge.UiThreadUtil;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.MethodChannel;

public class FlutterEngineHelper {

    private static FlutterEngineHelper instance;

    private FlutterEngineHelper(){}

    public static FlutterEngineHelper getInstance() {
        if (instance == null) {
            instance = new FlutterEngineHelper();


        }
        return instance;
    }

    public static final String ENGINE_GROUP_ID = "my_engine_id";

    private static MethodChannel channel;

    public void initEngineGroup(Context context) {
        FlutterEngine flutterEngine = new FlutterEngine(context);

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.getDartExecutor().executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        );

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
                .getInstance()
                .put(ENGINE_GROUP_ID, flutterEngine);

        channel = new MethodChannel(flutterEngine.getDartExecutor(),"dev.flutter.example/counter");
        // channel.setMethodCallHandler((call, result) -> {
        //     if (call.method == "getBatteryLevel") {
        //         String params = this.getParams();
        //         result.success(1000);
        //     }else if (call.method == "incrementCounter") {

        //         result.success(1000);
        //     }else if (call.method == "reportCounter") {

        //         result.success(1000);
        //     }
        //     else if (call.method == "requestCounter") {

        //         result.success(1000);
        //     }
        // });
    }

    public void fireEvent(String params){
        UiThreadUtil.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                channel.invokeMethod("miniapp",params);
            }
        });
    }

    private String params;
    public void setParams(String params){
        this.params = params;
    }

    public String getParams(){
        return this.params;
    }
}
