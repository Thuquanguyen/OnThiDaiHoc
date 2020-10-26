package com.luyenthidaihoc.daihoctrongtoi;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

import java.util.Calendar;

import static com.luyenthidaihoc.daihoctrongtoi.AlarmUtils.CHANNEL_1_ID;

public class MyReceiver extends BroadcastReceiver {
    private NotificationManagerCompat notificationManager;
    @Override
    public void onReceive(Context context, Intent intent) {
        notificationManager = NotificationManagerCompat.from(context);
        sendOnChannel1(context,intent);
    }
    private void createAlarm(Context context)
    {
        AlarmManager alarmMgr = (AlarmManager)context.getSystemService(Context.ALARM_SERVICE);
        Intent intent = new Intent(context, MyReceiver.class);
        PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 0, intent, 0);
        alarmMgr.cancel(pendingIntent);
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        calendar.set(Calendar.HOUR_OF_DAY, 9);
        calendar.set(Calendar.MINUTE, 20);
        alarmMgr.set(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), pendingIntent);
    }
    public void sendOnChannel1(Context context,Intent notificationIntent) {
        Notification notification = new NotificationCompat.Builder(context, CHANNEL_1_ID)
                .setSmallIcon(R.drawable.launch_background)
                .setContentTitle("Bạn ơi!!!")
                .setContentText("Đến giờ ôn thi rồi! Cùng nhau cố gắng đạt điểm 10 bạn nhé! Mình tin bạn sẽ làm được")
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .setCategory(NotificationCompat.CATEGORY_MESSAGE)
                .build();
        notificationIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        PendingIntent contentIntent = PendingIntent.getActivity(context, 0, notificationIntent, PendingIntent.FLAG_UPDATE_CURRENT);
        notification.contentIntent = contentIntent;
        notification.flags |= Notification.FLAG_AUTO_CANCEL;
        notificationManager.notify(1, notification);
        createAlarm(context);
    }
}