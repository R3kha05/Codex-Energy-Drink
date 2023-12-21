# Codex-Energy-Drink
--1.	Demographic Insights (examples) 
--a.	Who prefers energy drink more?  (male/female/non-binary?) 
select count( [Respondent_ID]) as response,gender from[dbo].[dim_repondents]
group by Gender
order by count( [Respondent_ID]) desc
--b.	Which age group prefers energy drinks more? 
select count( [Respondent_ID]) as response,[Age]from[dbo].[dim_repondents]
group by age
order by count( [Respondent_ID]) desc
--c.	Which type of marketing reaches the most Youth? 
 select count( [Response_ID]) as response,[Marketing_channels]from [dbo].[fact_survey_responses]
 group by [Marketing_channels]
 order by count( [Response_ID]) desc
--2.	Consumer Preferences: 
--a.	What are the preferred ingredients of energy drinks among respondents?
	select count( [Response_ID]) as response, [Ingredients_expected]from [dbo].[fact_survey_responses]
	group by [Ingredients_expected]
	order by count( [Response_ID]) desc
--b.	What packaging preferences do respondents have for energy drinks? 
	select  count( [Response_ID]) as response, [Packaging_preference] from [dbo].[fact_survey_responses]
	group by [Packaging_preference]
	order by count( [Response_ID]) desc
--3.	Competition Analysis: 
--a.	Who are the current market leaders? 
select count( [Response_ID]) as response,[Current_brands] from [dbo].[fact_survey_responses]
group by [Current_brands]
	order by count( [Response_ID]) desc
--b.	What are the primary reasons consumers prefer those brands over ours? 
 select count( [Response_ID]) as response, [Reasons_for_choosing_brands]from [dbo].[fact_survey_responses] 
 group by [Reasons_for_choosing_brands]
order by count( [Response_ID]) desc
--4.	Marketing Channels and Brand Awareness: 
--a.	Which marketing channel can be used to reach more customers? Online ads(4020)
	select count( [Response_ID]) as response,[Marketing_channels] from [dbo].[fact_survey_responses]
	 group by [Marketing_channels]
     order by count( [Response_ID]) desc

--b.	How effective are different marketing strategies and channels in reaching our customers? 
 select count( [Response_ID]) as response , [Packaging_preference],[Marketing_channels] from [dbo].[fact_survey_responses]
 group by [Marketing_channels],[Packaging_preference]
 order by count( [Response_ID]) desc

--5.	Brand Penetration: 
--a.	What do people think about our brand? (overall rating),heard before,tried before 
select count( [Response_ID]),[Taste_experience]  
from [dbo].[fact_survey_responses]
group by [Taste_experience]
order by count( [Response_ID]) desc
--

select count( [Response_ID]),[Heard_before]  
from [dbo].[fact_survey_responses]
group by [Heard_before]
order by count( [Response_ID]) desc
--
select count( [Response_ID]),  [Tried_before]
from [dbo].[fact_survey_responses]
group by[Tried_before]
order by count( [Response_ID]) desc
--b.	Which cities do we need to focus more on? 
 select c.City,COUNT(d.Respondent_ID) as response,
 ROUND((COUNT(d.Respondent_ID)/100),3) as percentage_of_response
 from [dbo].[dim_cities] as c 
 join [dbo].[dim_repondents]as d on c.City_ID=d.City_ID
 group by c.City
 order by response

 
 --6.	Purchase Behavior: 
--a.	Where do respondents prefer to purchase energy drinks? 
select COUNT(Respondent_ID)as response, [Purchase_location]
from [dbo].[fact_survey_responses]
group by [Purchase_location]
order by response desc

select * from [dbo].[fact_survey_responses]
--b.	What are the typical consumption situations for energy drinks among respondents? 
select[Typical_consumption_situations],
COUNT(Respondent_ID)as response
from [dbo].[fact_survey_responses]
group by [Typical_consumption_situations]
order by response desc
--c.	What factors influence respondents' purchase decisions, such as price range and limited edition packaging? 
 select COUNT(Respondent_ID)as response,
 [Price_range],[Limited_edition_packaging]
 from [dbo].[fact_survey_responses]
 group by [Price_range],
 [Limited_edition_packaging]
 order by response desc
--7.	Product Development 
select * from [dbo].[fact_survey_responses]

--a.	Which area of business should we focus more on our product development? (Branding/taste/availability) 
 select COUNT(Respondent_ID)as response,
 [Reasons_for_choosing_brands]
 from [dbo].[fact_survey_responses]
 where [Current_brands]='CodeX'
 group by [Reasons_for_choosing_brands]
 order by response desc
