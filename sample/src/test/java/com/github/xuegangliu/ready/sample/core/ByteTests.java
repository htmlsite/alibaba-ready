package com.github.xuegangliu.ready.sample.core;

import com.github.xuegangliu.ready.sample.utils.LogPrint;
import org.junit.Test;

/**
 * ByteTests
 * <p>
 * This is description
 * </p>
 *
 * @author xuegangliu 2019/09/03
 * @since 1.8
 **/
public class ByteTests {

    @Test
    public void test1(){
        System.out.println('\u0000');
        System.out.println('\uFFFF');
        System.out.println(0xff);
        Byte t1 = 126;
        Byte t2 = 126;
        System.out.println(t1==t2);

        System.out.println((int) t1);

        System.out.println(-1<<7);
    }
}
