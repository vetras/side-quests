package org.sample;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@State(Scope.Benchmark)
public class IterateThroughHashMapTest {
    private final static Integer SIZE = 100;

    @Param({"100","1000"})
    public int size;

    private Map<Integer, Integer> map = new HashMap<>(SIZE);

    /** 1. Using iterator and Map.Entry **/
    @Benchmark
    public long test1_UsingWhileAndMapEntry() throws IOException {
        long i = 0;
        Iterator<Map.Entry<Integer, Integer>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<Integer, Integer> pair = it.next();
            i += pair.getKey() + pair.getValue();
        }
        return i;
    }

    /** 2. Using foreach and Map.Entry **/
    @Benchmark
    public long test2_UsingForEachAndMapEntry() throws IOException {
        long i = 0;
        for (Map.Entry<Integer, Integer> pair : map.entrySet()) {
            i += pair.getKey() + pair.getValue();
        }
        return i;
    }

    /** 3. Using foreach from Java 8 **/
    @Benchmark
    public long test3_UsingForEachAndJava8() throws IOException {
        final long[] i = {0};
        map.forEach((k, v) -> i[0] += k + v);
        return i[0];
    }

    /** 7. Using Java 8 Stream Api **/
    @Benchmark
    public long test7_UsingJava8StreamApi() throws IOException {
        final long[] i = {0};
        map.entrySet().stream().forEach(e -> i[0] += e.getKey() + e.getValue());
        return i[0];
    }

    /** 8. Using Java 8 Stream Api parallel **/
    @Benchmark
    public long test8_UsingJava8StreamApiParallel() throws IOException {
        final long[] i = {0};
        map.entrySet().stream().parallel().forEach(e -> i[0] += e.getKey() + e.getValue());
        return i[0];
    }


    /** 11. Using Java 8 Stream Api 2 **/
    @Benchmark
    public long test11_UsingJava8StreamApi2() throws IOException {
        return map.entrySet().stream().mapToLong(e -> e.getKey() + e.getValue()).sum();
    }

    /** 12. Using Java 8 Stream Api parallel 2  **/
    @Benchmark
    public long test12_UsingJava8StreamApiparallel2() throws IOException {
        return map.entrySet().parallelStream().mapToLong(e -> e.getKey() + e.getValue()).sum();
    }

    @TearDown(Level.Iteration)
    public void tearDown() {
        map = new HashMap<>(size);
        for (int i = 0; i < size; i++) {
            map.put(i, i);
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(IterateThroughHashMapTest.class.getSimpleName())
                .timeUnit(TimeUnit.MICROSECONDS)
                .warmupIterations(3)
                .measurementIterations(5)
                .param("size","100",/*"500","900","1300","1700","2100","2500","5000","10000","15000","20000","25000" ,*/ "30000")
                .forks(1)
                .mode(Mode.AverageTime)
                .build();

        new Runner(opt).run();
    }
}
