package com.luyenthidaihoc.daihoctrongtoi;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.SystemClock;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

import java.util.Calendar;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

import static com.luyenthidaihoc.daihoctrongtoi.AlarmUtils.CHANNEL_1_ID;

public class MainActivity extends FlutterActivity {
  private AlarmManager alarmMgr;
  private PendingIntent alarmIntent;
  private NotificationManagerCompat notificationManager;

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    notificationManager = NotificationManagerCompat.from(getContext());
    alarmMgr = (AlarmManager)getSystemService(Context.ALARM_SERVICE);
    Intent intent = new Intent(this, MyReceiver.class);
    alarmIntent = PendingIntent.getBroadcast(this, 0, intent, 0);
    Calendar calendar = Calendar.getInstance();
    calendar.setTimeInMillis(System.currentTimeMillis());
    calendar.set(Calendar.HOUR_OF_DAY, 9);
    calendar.set(Calendar.MINUTE, 20);
    alarmMgr.setRepeating(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(),
            1000 * 60 * 20, alarmIntent);
    if (alarmMgr!= null) {
      alarmMgr.cancel(alarmIntent);
    }
    SharedPreferences sharedPref = getActivity().getPreferences(Context.MODE_PRIVATE);
    int highScore = sharedPref.getInt("check", 0);
    if (highScore == 0)
    {
      sendOnChannel1(getActivity().getIntent());
    }
    SharedPreferences.Editor editor = sharedPref.edit();
    editor.putInt("check", 1);
    editor.commit();
  }

  public void sendOnChannel1(Intent notificationIntent) {
    android.app.Notification notification = new NotificationCompat.Builder(getContext(), CHANNEL_1_ID)
            .setSmallIcon(R.drawable.launch_background)
            .setContentTitle("Chào mừng bạn đến với ứng dụng Ôn Thi Đại Học")
            .setContentText("Chúc bạn thành công trên con đường sắp tới")
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_MESSAGE)
            .build();
    notificationIntent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
    PendingIntent contentIntent = PendingIntent.getActivity(getContext(), 0, notificationIntent, PendingIntent.FLAG_UPDATE_CURRENT);
    notification.contentIntent = contentIntent;
    notification.flags |= android.app.Notification.FLAG_AUTO_CANCEL;
    notificationManager.notify(1, notification);
  }

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

  }
}
