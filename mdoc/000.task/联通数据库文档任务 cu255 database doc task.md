## design

- go sqlx或sql库
- 程序入口可指定数据库信息，翻译文件
- 使用go获取数据库的描述信息 desc table
- 填写'字段名', '字段描述', '数据类型', '是否可空', '默认值', '是否主键', '备注'信息
- 如果有备注，使用备注。
- 没有备注，使用翻译文件中字段
- 将翻译后的字段填入到excel文件中

## task

- [x] 调研一下sqlx或sql库
- [x] 调研一下mysql的schema信息，获取数据库，表，列属性, comment
```sql
SELECT COLUMN_NAME, DATA_TYPE , CHARACTER_MAXIMUM_LENGTH , COLUMN_TYPE , COLUMN_COMMENT ,  IS_NULLABLE  
	FROM INFORMATION_SCHEMA.COLUMNS
  		WHERE TABLE_SCHEMA = 'uni_auth' AND TABLE_NAME = 'mdm_user';
		
# 创建一个字典表
SELECT COLUMN_NAME, count(COLUMN_NAME) as cnt from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA not in 
	('information_schema', 'performance_schema', 'sys',  'mysql', 'mysql_innodb_cluster_metadata')
	group by COLUMN_NAME order by cnt DESC ;
	
```
	- [ ] 
- 调研一下go的excel库
