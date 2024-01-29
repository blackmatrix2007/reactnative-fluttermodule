package com.fluttermodulern;

import static com.facebook.react.bridge.UiThreadUtil.runOnUiThread;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterActivityLaunchConfigs;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.plugin.common.MethodChannel;

public class FlutterModuleRnModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public FlutterModuleRnModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @NonNull
    @Override
    public String getName() {
        return "FlutterModuleRn";
    }

    @ReactMethod
    public void startFlutterActivity(String stringArgument,String data, int numberArgument, Callback callback) {
        Activity currentActivity = reactContext.getCurrentActivity();
        // we can pass arguments to the Intent
        currentActivity.startActivity(
                FlutterActivity
                        .withCachedEngine(FlutterEngineHelper.ENGINE_GROUP_ID)
                        .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                        .build(currentActivity)

        );

        FlutterEngineHelper.getInstance().fireEvent(data);
        callback.invoke("Received numberArgument: " + numberArgument + " stringArgument: " + stringArgument);
    }
}