# Running TestLink in container

1. Build a container

```
docker build -t testlink .
```

2. Run containers with docker-compose

```
docker-compose up -d
```

3. Go to [localhost](http://localhost:8080) and start new installation

4. On Database Configuration screen put the following settings:

Database host: tldb

Database name: testlink

Database admin login: root

Database admin password: e83c82ea552540f8

TestLink DB login: root

TestLink DB password: e83c82ea552540f8

5. Copy script from testlink container

```
docker cp testlink_testlink_1:/testlink/install/sql/mysql/testlink_create_udf0.sql .
```

6. Modify this SQL script:

Change YOUR_TL_DBNAME to database name (testlink)

6. Run modified script

```
docker exec testlink_tldb_1 mysql --user root -pe83c82ea552540f8 < testlink_create_udf0.sql
```

7. [Enjoy](http://localhost:8080)!

admin

admin