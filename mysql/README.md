# 功能 实现 知识点

## 统计每个学生各门课的期末成绩,以学号和课程号分组

```mysql
drop table ssc;
create table ssc
(
    SId   int not null,
    CId   int             not null,
    score float           not null
);
INSERT INTO ssc (sid, cid, score)
SELECT one.SId, one.CId, one.SCScore3
FROM sc one
         INNER JOIN sc two ON one.SId = two.SId AND one.CId = two.CId
group by one.SId, one.CId;
```

### 创建表

###  `group by子句`

`GROUP BY` 子句用于将具有相同值的行分组到一起，并执行聚合计算。在这个例子中，`GROUP BY` 子句指定了两个列名 `one.SId` 和 `one.CId`，表示要根据这两个列的值对查询结果进行分组。

具体来说，该查询通过将具有相同 `SId` 和 `CId` 值的行分组在一起，将一个学生在一个课程中的多条选课记录合并成一条记录，同时对这些记录的其他属性进行聚合计算，例如求和、平均值等。

需要注意的是，如果在 `SELECT` 子句中选择的列不包括在 `GROUP BY` 中，则这些列的值将无法精确地确定。在这种情况下，MySQL 会随机选择一个值作为结果，而不是给出一个错误或警告。因此，在使用 `GROUP BY` 时应该特别小心，确保查询语句正确表达了你的意图。

### `INNER JOIN` 语句

自身链接的时候用.



## 模式

### 外模式（External Schema）

是指用户或应用程序所`看到`和访问的`数据库的逻辑结构`，也称为用户模式。而内模式（Internal Schema）则是数据库真正存储数据的物理结构。

### 模式（Schema）

指的是数据库中对象的结构和相关规则的描述，包括表、视图、索引等，它们定义了数据库的逻辑结构和约束条件。因此，外模式和内模式都是模式的不同方面：前者描述了用户如何看到数据，后者描述了数据如何实际存储在计算机上。

总之，外模式和内模式是数据库设计中的两个概念，描述了不同层次上的数据库结构，并且它们可以相互转换，从而满足不同用户或应用程序的需求。

## 视图(view)

### 创建视图

```MySQL
create view avgg(sid,avgsorce)
as
select ssc.sid,avg(ssc.score)
FROM ssc
group by ssc.sid;
```

### 视图来源

1. 建立于已经定义的表

2. 建立于已经定义好的视图

3. 建立于已经定义好的视图和表

### 带表达式的视图(带虚拟列的视图)

```mysql
create view avgg(sid,avgsorce)
as
select ssc.sid,100-avg(ssc.score)
FROM ssc
group by ssc.sid;

```

视图中的基本数据是通过其他表或者视图中的数据通过`计算`派生得到的



### 删除视图

```mysql
drop view view_name cascade
```

`cascade` 关键字表示删除视图及在它基础之上导出的视图

## 统计每个班的人数,并降序排列

```mysql
select GId,count(SId)
from student
group by GId
having count(SId) > 1
order by count(SId) desc

```

## 查询学习中文的学生姓名[不相关子查询]

``` mysql
select SName
    from student
        where SId in
              (select SId from sc where CId in(
                  select CId from course where CNAME = 'Chinese'
                  ))

```

## 查询学生所修课程中大于所选课程平均分的课程id并列出学生id

```mysql
select  SId,CId
from sc x
where x.SCScore3> (select avg(SCScore3) from sc y where x.SId=y.SId)
```

## 查询选修了2号课程的学生姓名[exist谓词]

```mysql
select  SName
from student
where exists (select * from sc where student.SId=sc.SId and CId=2);
```

