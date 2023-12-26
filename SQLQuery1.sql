use [F_and_Beverage]
select * from [dbo].[dim_cities]
select * from[dbo].[dim_repondents]
select * from[dbo].[fact_survey_responses]

--a.	Who prefers energy drink more?  (male/female/non-binary?) 
select COUNT(respondent_ID) as ,Gender
from [dbo].[dim_repondents] 
group by Gender

--b.	Which age group prefers energy drinks more? 
select COUNT(respondent_ID) ,Age
from [dbo].[dim_repondents] 
group by Age
order by COUNT(respondent_ID) desc

--c.	Which type of marketing reaches the most Youth (15-30)? 
select count (f.Respondent_ID),r.Age,f.Marketing_channels
from [dim_repondents] as r join
[fact_survey_responses] as f on r.Respondent_ID=f.Respondent_ID
group by r.Age,f.Marketing_channels
order by count (f.Respondent_ID) desc

--Consumer Preferences: 
--What are the preferred ingredients of energy drinks among respondents? 

select COUNT(respondent_ID),Ingredients_expected
from fact_survey_responses
group by Ingredients_expected


