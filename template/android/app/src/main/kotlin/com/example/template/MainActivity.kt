package com.example.template

import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onStop() {
        window.setFlags(WindowManager.LayoutParams.FLAG_SECURE,WindowManager.LayoutParams.FLAG_SECURE)
        
        super.onStop()
    }
//
//    override fun onRestart() {
//        window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
//        super.onRestart()
//    }
}
