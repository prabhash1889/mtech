DELIMITER $$

DROP PROCEDURE IF EXISTS SendWatchTimeReport $$
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_sub INT;
    DECLARE cur CURSOR FOR
        SELECT DISTINCT SubscriberID
        FROM WatchHistory;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_sub;
        IF done THEN
            LEAVE read_loop;
        END IF;
        CALL GetWatchHistoryBySubscriber(v_sub);
    END LOOP;
    CLOSE cur;
END $$

DELIMITER ;

CALL SendWatchTimeReport();