-- Databricks notebook source
CREATE TABLE employeesv2 
  ( id INT, name string, salary double); 

-- COMMAND ----------

INSERT INTO employeesv2
VALUES ( 1, "Adam", 3500.00),
(2, "Sarah", 4020.00),
(3, "John", 2999.3),
(4, "Thomas", 4000.3),
(5, "Anna", 2500.0),
(6, "Kim", 6200.3);

-- COMMAND ----------

select * from employeesv2;

-- COMMAND ----------

describe detail employeesv2;

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/user/hive/warehouse/employeesv2

-- COMMAND ----------

UPDATE employeesv2 set salary = 10000 where name = 'Kim';

-- COMMAND ----------

describe history employeesv2;

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/user/hive/warehouse/employeesv2

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/user/hive/warehouse/employeesv2/_delta_log/

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC .crc => checksum of the json file

-- COMMAND ----------

-- MAGIC %fs head dbfs:/user/hive/warehouse/employeesv2/_delta_log/00000000000000000003.json

-- COMMAND ----------

select * from employeesv2;

-- COMMAND ----------

select * from employeesv2 version as of 1 ;

-- COMMAND ----------

select * from employeesv2@v2

-- COMMAND ----------

DELETE FROM employeesv2;

-- COMMAND ----------

selecT * from employeesv2@v3;

-- COMMAND ----------

describe history employeesv2;

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/user/hive/warehouse/employeesv2/

-- COMMAND ----------

describe detail employeesv2;

-- COMMAND ----------

optimize employeesv2 zorder by id ; 

-- COMMAND ----------

vacuum employeesv2; 

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/user/hive/warehouse/employeesv2

-- COMMAND ----------

describe detail employeesv2;

-- COMMAND ----------

-- MAGIC   %sql
-- MAGIC   set spark.databricks.delta.retentionDurationCheck.enabled = false;
-- MAGIC 
-- MAGIC   vacuum employeesv2 RETAIN 0 hours;

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/user/hive/warehouse/employeesv2

-- COMMAND ----------

select * from employeesv2;

-- COMMAND ----------

drop table employeesv2;

-- COMMAND ----------

select * from employeesv2;

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/user/hive/warehouse/employeesv2

-- COMMAND ----------


