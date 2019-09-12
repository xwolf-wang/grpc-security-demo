package com.xwolf.grpcclient;

import com.xwolf.grpc.lib.GreeterGrpc;
import com.xwolf.grpc.lib.GreeterOuterClass;
import io.grpc.Channel;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.stereotype.Service;


@Service
public class GrpcClientService {

    @GrpcClient("local-grpc-server")
    private GreeterGrpc.GreeterBlockingStub stub;

    public String sendMessage(String name) {
        GreeterOuterClass.HelloReply response = stub.sayHello(GreeterOuterClass.HelloRequest.newBuilder().setName(name).build());
        return response.getMessage();
    }
}
