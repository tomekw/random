#!/usr/bin/env bash

GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-19.1.1/Contents/Home
JAVA_HOME=$GRAALVM_HOME

rm -rf classes/
mkdir -p classes
clj -e "(compile 'com.tomekw.random.core)"

$GRAALVM_HOME/bin/native-image \
	-cp $(clj -Spath) \
	-H:+ReportExceptionStackTraces \
	-H:+PrintClassInitialization \
	-H:Name=random-number \
	--initialize-at-build-time \
	--no-server \
	--no-fallback \
	--verbose \
	com.tomekw.random.core
