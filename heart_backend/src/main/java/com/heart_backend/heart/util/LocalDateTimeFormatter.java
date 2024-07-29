package com.heart_backend.heart.util;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

/**
 * LocalDateTimeFormatter
 */
public class LocalDateTimeFormatter {

    public static LocalDateTime objectToLocalDateTime(Object dateTime) {
        Date date = (Date) dateTime;
        return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
    }
}