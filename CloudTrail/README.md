# CloudTrail

```
aws cloudtrail lookup-events

aws cloudtrail lookup-events --max-items 100

aws cloudtrail lookup-events --start-time 2023-08-17 --end-time 2023-08-18

aws cloudtrail lookup-events --start-time 2023-08-17 --end-time 2023-08-18 --max-items 100
```


QUERY 1  
```
//Query based on a username.
SELECT *
FROM "default"."cloudtrail_logs_my_acg_test_cloudtrail_logs"
WHERE 
    useridentity.username = 'TheAlexanderHiggins@gmail.com'
LIMIT 10;
```
QUERY 2
```
//Query Based on multiple users.
SELECT *
FROM "default"."cloudtrail_logs_my_acg_test_cloudtrail_logs"
WHERE
    useridentity.username = 'TheAlexanderHiggins@gmail.com' OR
    useridentity.username = 'alex.higgins' OR
    useridentity.username = 'andrew.kroll'
LIMIT 10;
```
QUERY 3
```
//See active users in the last 7 days.
SELECT DISTINCT useridentity.username
FROM "default"."cloudtrail_logs_my_acg_test_cloudtrail_logs"
WHERE 
    from_iso8601_timestamp(eventtime) > date_add('day', -7, now())
LIMIT 10;
```
