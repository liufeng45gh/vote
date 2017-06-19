
ps -ef|grep vote-1.0-SNAPSHOT.jar|awk '{print $2}'|xargs kill -9

mvn package

cp target/vote-1.0-SNAPSHOT.jar ./vote-1.0-SNAPSHOT.jar

nohup java -jar ./vote-1.0-SNAPSHOT.jar > ./nohup.out &


