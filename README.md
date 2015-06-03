# test HDFS
# write
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -write -nrFiles 24 -fileSize 1000 -seq &>> hadoop_write_rp1.log
# sequence read
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -read -nrFiles 24 -fileSize 1000 -seq &>> hadoop_read_seq.log
# random read
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -read -random -nrFiles 24 -fileSize 1000 -seq &>> hadoop_read_ran.log
# backward read
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -read -backward -nrFiles 24 -fileSize 1000 -seq &>> hadoop_read_bac.log
# multi processes
./BatchTestDFSIO.sh 2 "-write -nrFiles 12 -fileSize 1000 -seq" hadoop_write_rp1.log

# test tachyon
# write
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -libjars /home/michael/tachyon/tachyon-0.6.3/client/target/tachyon-client-0.6.3-jar-with-dependencies.jar -write -nrFiles 24 -fileSize 1000 -fs tachyon://master:19998 -seq &>> tachyon_write.log
# sequence read
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -libjars /home/michael/tachyon/tachyon-0.6.3/client/target/tachyon-client-0.6.3-jar-with-dependencies.jar -read -nrFiles 24 -fileSize 1000 -fs tachyon://master:19998 -seq &>> tachyon_read_seq.log
# random read
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -libjars /home/michael/tachyon/tachyon-0.6.3/client/target/tachyon-client-0.6.3-jar-with-dependencies.jar -read -random -nrFiles 24 -fileSize 1000 -fs tachyon://master:19998 -seq &>> tachyon_read_ran.log
# backward read
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-tests.jar TestDFSIO -libjars /home/michael/tachyon/tachyon-0.6.3/client/target/tachyon-client-0.6.3-jar-with-dependencies.jar -read -backward -nrFiles 24 -fileSize 1000 -fs tachyon://master:19998 -seq &>> tachyon_read_bac.log
# multi processes
./BatchTestDFSIO_Tachyon.sh 2 "-write -nrFiles 12 -fileSize 1000 -fs tachyon://master:19998 -seq" tachyon_write.log
