@ECHO off

set TIMESTAMP=%DATE:~-4,4%%DATE:~-7,2%%DATE:~-10,2%


"C:\Program Files\MySQL\MySQL Workbench 6.3 CE\mysqldump.exe" --routines --all-databases --result-file="F:\Documents\Lectures\Sem1\Database\Assignments\Project\db\dump\%TIMESTAMP%_mysqldump.sql" --user=root --password=shruti



