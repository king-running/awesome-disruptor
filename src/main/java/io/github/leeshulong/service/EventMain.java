package io.github.leeshulong.service;

import com.lmax.disruptor.BlockingWaitStrategy;
import com.lmax.disruptor.SleepingWaitStrategy;
import com.lmax.disruptor.WaitStrategy;
import com.lmax.disruptor.YieldingWaitStrategy;
import com.lmax.disruptor.dsl.Disruptor;
import com.lmax.disruptor.dsl.ProducerType;
import io.github.leeshulong.base.LongEvent;
import io.github.leeshulong.base.LongEventFactory;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class EventMain {

    public static void main(String[] args) {
        //线程池
        ExecutorService executorService = Executors.newCachedThreadPool();

        LongEventFactory factory = new LongEventFactory();

        //创建buffersize，ringbuffer的大小 必须是2的n次方
        int ringBufferSize = 1024 * 1024;

//        BlockingWaitStrategy
//        最低效的策略，但其对cpu的消耗最小，各种不同部署环境中能提供更加一致性能表现
        BlockingWaitStrategy blockingWaitStrategy = new BlockingWaitStrategy();



        //SleepingWaitStrategy
//        对cpu和BlockingWaitStrategy 类似，但其对生产者线程的影响最小，适合异步日志类似的场景
        SleepingWaitStrategy sleepingWaitStrategy = new SleepingWaitStrategy();


//        性能是最好的，适用于低延迟的系统，在要求极高性能且时间处理线程数小于cpu和核心数的场景
        WaitStrategy yieldingWaitStrategy = new YieldingWaitStrategy();

        Disruptor<LongEvent> longEventDisruptor = new Disruptor<LongEvent>(factory, ringBufferSize, executorService, ProducerType.SINGLE, new YieldingWaitStrategy());




    }
}
