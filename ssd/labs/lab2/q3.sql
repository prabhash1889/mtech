DELIMITER $$

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists $$
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Subscribers WHERE SubscriberName = subName) THEN
        INSERT INTO Subscribers(SubscriberName, SubscriptionDate)
        VALUES (subName, CURDATE());
        SELECT 'Subscriber added' AS Result;
    ELSE
        SELECT 'Subscriber already exists' AS Result;
    END IF;
END $$

DELIMITER ;

CALL AddSubscriberIfNotExists('Jordan Smith');
CALL AddSubscriberIfNotExists('Alex Morgan');