CS6.302 – Lab-2
Roll No.: 2025201089
GitHub Repository: https://github.com/prabhash1889/mtech/tree/main/ssd/labs/lab2

PREREQUISITES

1. MySQL Server 8.x
2. MySQL Workbench 
3. One empty schema/database (lab2).

STEPS TO EXECUTE
1. Clone / download the repository.
2. Open MySQL Workbench → connect to your local server.
3. Create and select the target schema:
   CREATE DATABASE IF NOT EXISTS lab2;
   USE lab2;
4. Load the Activity data once:
   Run the CREATE-TABLE and INSERT statements exactly as given in the original PDF.
   (These statements are NOT included in the ZIP; they are only needed for testing.)
5. Execute each solution script in order:
   • q1.sql  → CALL ListAllSubscribers();
   • q2.sql  → CALL GetWatchHistoryBySubscriber(<SubscriberID>);
   • q3.sql  → CALL AddSubscriberIfNotExists('New Subscriber');
   • q4.sql  → CALL SendWatchTimeReport();
   • q5.sql  → CALL PrintAllWatchHistories();

FILES INSIDE ZIP

q1.sql – ListAllSubscribers() with cursor
q2.sql – GetWatchHistoryBySubscriber(IN sub_id INT)
q3.sql – AddSubscriberIfNotExists(IN subName VARCHAR(100))
q4.sql – SendWatchTimeReport()->(nested call to Q2)
q5.sql – PrintAllWatchHistories() (cursor + nested call)
README.TXT – this file

