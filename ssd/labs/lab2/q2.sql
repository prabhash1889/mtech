DELIMITER $$

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber $$
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT s.Title,
           s.Genre,
           w.WatchTime
    FROM WatchHistory w
    JOIN Shows s ON w.ShowID = s.ShowID
    WHERE w.SubscriberID = sub_id
    ORDER BY w.WatchTime DESC;
END $$

DELIMITER ;

CALL GetWatchHistoryBySubscriber(2);