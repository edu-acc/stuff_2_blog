--Решение в PostgreSQL
with cte_grp as(
select empno, comm
,count (comm) over (order by empno) grp
from scott.emp)
select empno, comm
,max(comm) over (partition by grp) comm_ignore_nulls
from cte_grp