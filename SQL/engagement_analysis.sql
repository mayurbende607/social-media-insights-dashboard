CREATE DATABASE SOCIAL_MEDIA_REAL;
USE SOCIAL_MEDIA_REAL;


show tables;
describe social_posts;
select*from social_posts;




select count(*) as total_rows from social_posts;

select * from social_posts limit 10;

-- 1 platform wise post count
-- to find the platform that most active

select platform ,count(*) as total_posts
from social_posts
group by platform
order by total_posts desc;

-- Total Engagement by Platform
-- or best performs platforms
select platform ,sum(likes + comments + shares) as total_engagement
from social_posts
group by platform
order by total_engagement desc;

-- top 10 performing posts, viral
select post_id,platform,(likes + comments + shares) as engagement
from social_posts
order by engagement desc
limit 10;

-- sentiment vs engagement

select sentiment_label, avg(likes + comments + shares) as avg_engagement
from social_posts
group by sentiment_label;

-- which content topics perform best
select topic_category, sum(likes + comments + shares) as engagement
from social_posts
group by topic_category
order by engagement desc;






-- -best day for engagement, for deside which day to post

select day_of_week,avg(likes + comments + shares) AS avg_engagement
FROM social_posts
group by day_of_week
order by avg_engagement desc;
-- 


-- top topics per platform 
select platform ,topic_category, sum(likes + comments + shares) as engement
from social_posts
group by platform, topic_category
order by platform, topic_category;

