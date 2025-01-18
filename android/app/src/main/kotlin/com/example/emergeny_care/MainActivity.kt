package com.mohamedibrahem.emergeny_care

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
     private val CHANNEL = "com.example.dualsimcall/calls"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "makeCall") {
                val phoneNumber = call.argument<String>("phoneNumber")
                val simSlot = call.argument<Int>("simSlot") ?: 1

                if (phoneNumber != null) {
                    makeCall(phoneNumber, simSlot)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGS", "Phone number or SIM slot missing", null)
                }
            }
        }
    }

    private fun makeCall(phoneNumber: String, simSlot: Int) {
        val intent = Intent(Intent.ACTION_CALL)
        intent.data = Uri.parse("tel:$phoneNumber")
        intent.putExtra("com.android.phone.extra.slot", simSlot - 1) // Adjust slot indexing
        startActivity(intent)
    }
}
