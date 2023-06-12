# mysql储存过程

## 成绩,学生信息表定义

```mysql
CREATE TABLE  exam (
  examno VARCHAR(50),
  stuno VARCHAR(50) PRIMARY KEY,
  exam1 DOUBLE,
  exam2 DOUBLE
) DEFAULT CHARSET=utf8;

CREATE TABLE `stuinfo` (
  `stuname` varchar(10) DEFAULT NULL,
  `stuno` varchar(10) DEFAULT NULL,
  `stusex` char(2) DEFAULT NULL,
  `stuage` int DEFAULT NULL,
  `stuseat` int DEFAULT NULL,
  `stuaddress` varchar(20) DEFAULT NULL,
  `lost` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

-- 查询表的完整定义
show create table stuinfo 
```

## 储存过程

### 新建一列,给成绩分类

```mysql

DELIMITER //
CREATE PROCEDURE CalculateGrade()
BEGIN

  ALTER TABLE exam ADD COLUMN grade VARCHAR(10);


  UPDATE exam
  SET grade =
    CASE
      WHEN (exam1 + exam2) < 60 THEN '不及格'
      WHEN (exam1 + exam2) >= 60 AND (exam1 + exam2) < 80 THEN '及格'
      WHEN (exam1 + exam2) >= 80 AND (exam1 + exam2) < 90 THEN '良好'
      ELSE '优秀'
    END;
END //
DELIMITER ;

```

### 新建一个列,表示那些是缺考了,并输出及格率

```mysql
drop procedure  statistics;
delimiter //
create procedure  statistics()
begin
  DECLARE total_students INT;
  DECLARE passed_students INT;
  DECLARE pass_rate DECIMAL(5, 2);

  SELECT COUNT(*) INTO total_students FROM exam;


  SELECT COUNT(*) INTO passed_students FROM exam WHERE (exam1 + exam2) >= 60;


  SET pass_rate = (passed_students / total_students) * 100;


  SELECT CONCAT('及格率为：', pass_rate, '%') AS pass_rate;
  alter table stuinfo add column lost char(10);
  UPDATE stuinfo
  SET lost = CASE
    WHEN stuno NOT IN (SELECT stuno FROM exam) THEN '缺考'
  ELSE 'OK'

  END;

end //
delimiter ;
call statistics();
```

对应的mysql查询语句

```mysql
-- 获取总学生数
SELECT COUNT(*) AS total_students FROM exam;

-- 获取及格学生数
SELECT COUNT(*) AS passed_students FROM exam WHERE (exam1 + exam2) >= 60;

-- 计算及格率
SELECT CONCAT('及格率为：', (passed_students / total_students) * 100, '%') AS pass_rate;

-- 添加lost列到stuinfo表
ALTER TABLE stuinfo ADD COLUMN lost CHAR(10);

-- 更新lost列的值
UPDATE stuinfo
SET lost = CASE
  WHEN stuno NOT IN (SELECT stuno FROM exam) THEN '缺考'
  ELSE 'OK'
END;

```

### exam输入及格线,统计及格率

```MySQL
show create table stuinfo;

DELIMITER //
CREATE PROCEDURE maxmin(IN p_stusex CHAR(2), OUT p_max_score DOUBLE, OUT p_min_score DOUBLE, OUT p_avg_score DOUBLE)
BEGIN
    SELECT
        MAX((exam1 + exam2) / 2) INTO p_max_score
    FROM
        exam
    -- 等值连接查询
    INNER JOIN  
        stuinfo ON exam.stuno = stuinfo.stuno
    WHERE
        stuinfo.stusex = p_stusex;


    SELECT
        MIN((exam1 + exam2) / 2) INTO p_min_score
    FROM
        exam
    INNER JOIN
        stuinfo ON exam.stuno = stuinfo.stuno
    WHERE
        stuinfo.stusex = p_stusex;


    SELECT
        AVG((exam1 + exam2) / 2) INTO p_avg_score
    FROM
        exam
    INNER JOIN
        stuinfo ON exam.stuno = stuinfo.stuno
    WHERE
        stuinfo.stusex = p_stusex;
END //

DELIMITER ;
SET @max_score = 0;
SET @min_score = 0;
SET @avg_score = 0;

CALL maxmin('男', @max_score, @min_score, @avg_score);

SELECT @max_score AS max_score, @min_score AS min_score, @avg_score AS avg_score;


```

