package org.sample;

import org.openjdk.jmh.annotations.Benchmark;

public class Loops {
    private final static Integer SIZE = 100;

    @Benchmark
    public void forLoop() {
        int j = 10;
        long h = 10;
        for (int i = 0; i < SIZE; i++) {
            j++;
            h +=j;
        }
    }

    @Benchmark
    public void whileLoop() {
        int j = 10;
        for (int i = 0; i < SIZE; i++) {
            j++;
        }
    }
}
