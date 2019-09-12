package com.github.xuegangliu.ready.sample.core;

import com.github.xuegangliu.ready.sample.utils.LogPrint;
import org.junit.Test;

/**
 * StringTests
 * <p>
 * This is description
 * </p>
 *
 * @author xuegangliu 2019/09/03
 * @since 1.8
 **/
public class StringTests {

    private LogPrint logPrint = new LogPrint();

    @Test
    public void test1(){
        String hello = "Hello World!";
        logPrint.error("111");
        logPrint.debug("111");
    }
}
