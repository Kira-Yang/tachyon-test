#!/bin/bash
for ((i=0; i<$1; i=i+1))
do
	echo $i
	bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -libjars /home/michael/tachyon/tachyon-0.6.3/client/target/tachyon-client-0.6.3-jar-with-dependencies.jar -dir /benchmarks/TestDFSIO$i $2 &>> $3.$1.$i &
done
