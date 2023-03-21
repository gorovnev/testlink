# Running TestLink in container

1. Make 'data' folder

```
mkdir data
```

2. [Download](https://sourceforge.net/projects/testlink/) TestLink archive and put it to data folder (ex. testlink-1.9.20.tar.gz)

3. Modify Dockerfile with correct archive name

4. Build a container

```
docker build -t testlink .
```

5. Run containers with docker-compose

```
docker-compose up -d
```

6. Go to [localhost](http://localhost:8080) and start new installation

7. On Database Configuration screen put the following settings:

Database host: tldb

Database name: testlink

Database admin login: root

Database admin password: e83c82ea552540f8

TestLink DB login: root

TestLink DB password: e83c82ea552540f8

8. Copy script from testlink container

```
docker cp testlink_testlink_1:/testlink/install/sql/mysql/testlink_create_udf0.sql .
```

9. Modify this SQL script:

Change YOUR_TL_DBNAME to database name (testlink)

10. Run modified script

```
docker exec testlink_tldb_1 mysql --user root -pe83c82ea552540f8 < testlink_create_udf0.sql
```

11. [Enjoy](http://localhost:8080)!

admin
 
admin