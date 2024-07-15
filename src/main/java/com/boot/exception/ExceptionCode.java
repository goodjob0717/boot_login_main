package com.boot.exception;

import lombok.Getter;

// 나성엽

@Getter
public enum ExceptionCode {
	UNABLE_TO_SEND_EMAIL("Unable to send email");

    private final String message;

    ExceptionCode(String message) {
        this.message = message;
    }
}