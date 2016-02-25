#!/bin/sh
echo 'Reset time is either 3AM or midnight according to sources...'
echo 'Reset time is 1AM KST for Asia, verified.'
echo 'Reroll seems to be delayed, only became available at 6AM KST'
TZ='America/Los_Angeles' date
TZ='Asia/Seoul' date
TZ='Europe/Berlin' date
