package com.heart_backend.heart.common;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * APIResponse
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class APIResponse {

    private Integer status = HttpStatus.OK.value();
    private Object data;
    private Object error;
}
