package com.fh.common;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
//@ControllerAdvice
public class GloblaExceptionHandle {

    @ExceptionHandler(Exception.class)
    // @ResponseBody
    public ServerResponse handException(Exception ex){
        ex.printStackTrace();
        return ServerResponse.error();

    }

}
