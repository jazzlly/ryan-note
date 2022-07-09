

### mysqldump

```sql
mysqldump -upekall -pApple12#$ mdm_reactor --no-create-info --compact --skip-extended-insert  > ~/mdm.1.1.sql
```

### mysql 5.6 用户授权 mysql user auth
```sql
GRANT ALL PRIVILEGES ON base_app_server.* TO "nba_db_user"@"192.168.9.11" IDENTIFIED BY 'Pekalldb12#$' WITH GRANT OPTION;
```

### string between two string 提取两字符串中间字符

```sql
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX("pka_tid_230__com_pekall_director", "pka_tid_", -1), '_', 1);
```

### group issue, select inner join subquery
```sql
SELECT mainQ.*, c.Name
FROM (
   SELECT a.`User`, MAX(a.Score) AS MaxScore, b.Color
   FROM TableA AS a
   INNER JOIN TableB AS b ON a.`User` = b.`User`
   GROUP BY a.`User`
) AS mainQ
INNER JOIN TableC AS c
ON mainQ.MaxScore = c.Score
```