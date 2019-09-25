package org.sample;

import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

public class BenchmarkApp {

    private static String tests = Loops.class.getSimpleName();

    public static void main(String[] args) throws RunnerException {

        String _UUID = UUID.randomUUID().toString();

        Options opt = new OptionsBuilder()
                .include(tests)
                .timeUnit(TimeUnit.MILLISECONDS)
                .warmupIterations(0)
                .measurementIterations(2)
                .param("size","100", "200")
                .forks(1)
                .mode(Mode.AverageTime)
                .build();

        System.out.println("Will run tests now...");

        new Runner(opt).run();
    }

}
