-- Count the number of videos per channel
SELECT
  channel_title,
  COUNT(*) AS video_count
FROM
  `youtube-database.cleansed-statistics`
GROUP BY
  channel_title
ORDER BY
  video_count DESC;

-- Join video data with channel data to show views per channel
-- Assuming channel data is in a separate table 'channel_data' and has a 'channel_id' field
SELECT
  v.video_id,
  v.title,
  v.channel_title,
  v.views
FROM
  `youtube-database.cleansed-statistics` v
JOIN
  channel_data c
ON
  v.channel_title = c.channel_title -- Assuming we join on channel_title
ORDER BY
  v.views DESC
LIMIT 10;

-- Select videos with more than 1 million views
SELECT
  title,
  views
FROM
  `youtube-database.cleansed-statistics`
WHERE
  CAST(views AS INT) > 1000000
ORDER BY
  views DESC;

-- Calculate the average likes per video
SELECT
  channel_title,
  AVG(CAST(likes AS INT)) AS avg_likes
FROM
  `youtube-database.cleansed-statistics`
GROUP BY
  channel_title;

-- Get videos uploaded in the last 30 days
SELECT
  title,
  publish_time
FROM
  `youtube-database.cleansed-statistics`
WHERE
  publish_time >= CURRENT_DATE - INTERVAL '30' DAY
ORDER BY
  publish_time DESC;

-- Get top 10 most viewed videos
SELECT
  title,
  views
FROM
  `youtube-database.cleansed-statistics`
ORDER BY
  CAST(views AS INT) DESC
LIMIT 10;

-- Get distinct channel titles
SELECT DISTINCT
  channel_title
FROM
  `youtube-database.cleansed-statistics`;
