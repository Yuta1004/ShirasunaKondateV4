plugins {
    application
    kotlin("jvm")
    id("com.google.protobuf")
}

dependencies {
    implementation(project(":stub"))

    implementation("com.google.protobuf:protobuf-kotlin:${rootProject.ext["protobufVersion"]}")
    implementation("io.grpc:grpc-kotlin-stub:${rootProject.ext["grpcKotlinVersion"]}")

    runtimeOnly("io.grpc:grpc-netty:${rootProject.ext["grpcVersion"]}")
}

application {
    mainClass.set("work.nitycnyuta.shirasunakondatev4.server.api.Main")
}
