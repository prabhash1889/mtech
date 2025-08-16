DELIMITER $$

DROP PROCEDURE IF EXISTS PrintAllWatchHistories $$
CREATE PROCEDURE PrintAllWatchHistories()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_sub INT;
    DECLARE v_name VARCHAR(100);

    DECLARE cur CURSOR FOR
        SELECT SubscriberID, SubscriberName
        FROM Subscribers
        ORDER BY SubscriberID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_sub, v_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('=== History for ', v_name, ' (ID=', v_sub, ') ===') AS Banner;

        CALL GetWatchHistoryBySubscriber(v_sub);
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;

CALL PrintAllWatchHistories();