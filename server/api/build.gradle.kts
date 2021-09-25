plugins {
    application
    kotlin("jvm")
    id("com.google.protobuf")
}

dependencies {
    implementation(project(":stub"))

    implementation("org.xerial:sqlite-jdbc:3.36.0")

    implementation("org.slf4j:slf4j-api:1.7.32")
    implementation("org.slf4j:slf4j-simple:1.7.32")

    implementation("com.google.protobuf:protobuf-kotlin:${rootProject.ext["protobufVersion"]}")
    implementation("io.grpc:grpc-kotlin-stub:${rootProject.ext["grpcKotlinVersion"]}")
    implementation("io.grpc:grpc-protobuf:${rootProject.ext["grpcVersion"]}")
    implementation("io.grpc:grpc-services:${rootProject.ext["grpcVersion"]}")

    runtimeOnly("io.grpc:grpc-netty:${rootProject.ext["grpcVersion"]}")
}

application {
    mainClass.set("work.nitycnyuta.shirasunakondatev4.server.api.Main")
}
