plugins {
    id("com.google.protobuf") version "0.8.17" apply false
    kotlin("jvm") version "1.5.21" apply false
    id("org.jlleitschuh.gradle.ktlint") version "9.2.1" apply false
    "java-library"
}

ext["grpcVersion"] = "1.37.0"
ext["grpcKotlinVersion"] = "1.1.0"
ext["protobufVersion"] = "3.17.0"

subprojects {
    repositories {
        mavenLocal()
        mavenCentral()
        google()
    }

    apply(plugin = "java")
    apply(plugin = "org.jlleitschuh.gradle.ktlint")
}
