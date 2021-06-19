
select 
datediff(month, @MinDate, Journal_Date) / 6 as Group1,
dateadd(month, datediff(month, '19000101',MIN(Journal_Date)),'19000101') as PeriodStart,
dateadd(day,-1,dateadd(month, 1+datediff(month, '19000101',MAX(Journal_Date)),'19000101')) as PeriodEnd,
sum(Gross_88ths_value) as ValueTotal from Topicevolve t
GROUP BY datediff(month, @MinDate, Journal_Date) / 6;

select top 26 
datediff(MONTH,'2015-01-01',FORMAT(CAST(CreationDate as date),'yyyy-MM-dd'))/3 as MonthName,
--FORMAT(CAST(CreationDate as date),'yyyy-MM-dd'),
dateadd(month, datediff(month, '19000101',MIN(FORMAT(CAST(CreationDate as date),'yyyy-MM-dd'))),'19000101') as PeriodStart,
dateadd(day,-1,dateadd(month, 1+datediff(month, '19000101',MAX(FORMAT(CAST(CreationDate as date),'yyyy-MM-dd'))),'19000101')) as PeriodEnd
 from Topicevolve 
 where FORMAT(CAST(CreationDate as date),'yyyy-MM-dd')>'2015-01-01'
group by datediff(MONTH,'2015-01-01',FORMAT(CAST(CreationDate as date),'yyyy-MM-dd')) /3
order by datediff(MONTH,'2015-01-01',FORMAT(CAST(CreationDate as date),'yyyy-MM-dd')) /3
