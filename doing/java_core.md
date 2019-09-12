## Java core记录

---

### 基本数据结构

### Byte
MIN_VALUE = -128
MAX_VALUE = 127
```java
    private static class ByteCache {
        private ByteCache(){}

        static final Byte cache[] = new Byte[-(-128) + 127 + 1];

        static {
            for(int i = 0; i < cache.length; i++)
                cache[i] = new Byte((byte)(i - 128));
        }
    }
```