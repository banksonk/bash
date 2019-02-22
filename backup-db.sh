#!/bin/bash

host=127.0.0.1
user=root
passwd=toor
dbname=database

direktori=/root/backup_db/sit/
delete=Y
harian=Y
jmlharian=6
mingguan=Y
jmlmingguan=4
bulanan=Y
jmlbulanan=2

tanggal=$(date +%d)
kemarin=`date +%d -d "1 day"`
hari=$(date +%a)
bulan=$(date +%B)
minggu=$(date +%U)

if [ $tanggal -gt $kemarin ] && [ "$bulanan" == "Y" ]
then
        /opt/lampp/bin/mysqldump -h $host -u $user -p$passwd $dbname  | gzip > $direktori/$dbname'_'`date '+%m-%d-%Y'`'_'$bulan.sql.gz
else
        if [ "$hari" == "Sat" ] && [ "$mingguan" == "Y" ]
        then
                /opt/lampp/bin/mysqldump -h $host -u $user -p$passwd $dbname  | gzip > $direktori/$dbname'_'`date '+%m-%d-%Y'`'_'minggu$minggu.sql.gz
        else
        if [ "$harian" == "Y" ]
                then
                        /opt/lampp/bin/mysqldump -h $host -u $user -p$passwd $dbname  | gzip > $direktori/$dbname'_'`date '+%m-%d-%Y'`'_'$hari.sql.gz
                fi
        fi
fi


if [ "$delete" == "Y" ]
then
    NUMmingguLY=$[$jmlmingguan*7]
    jmlbulanan=$[$jmlbulanan*31]
    find $direktori/*Min.sql.gz -type f -mtime +$jmlharian -delete 2> /dev/null
    find $direktori/*Sen.sql.gz -type f -mtime +$jmlharian -delete 2> /dev/null
    find $direktori/*Sel.sql.gz -type f -mtime +$jmlharian -delete 2> /dev/null
    find $direktori/*Rab.sql.gz -type f -mtime +$jmlharian -delete 2> /dev/null
    find $direktori/*Kam.sql.gz -type f -mtime +$jmlharian -delete 2> /dev/null
    find $direktori/*Jum.sql.gz -type f -mtime +$jmlharian -delete 2> /dev/null
    find $direktori/*Sab.sql.gz -type f -mtime +$jmlharian -delete 2> /dev/null
    find $direktori/*Minggu*.sql.gz -type f -mtime +$jmlmingguan -delete 2> /dev/null
    find $direktori/*Januari.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*Pebruari.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*Maret.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*April.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*Mei.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*Juni.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*Juli.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*Agustus.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*September.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*Oktober.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*November.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
    find $direktori/*Desember.sql.gz -type f -mtime +$jmlbulanan -delete 2> /dev/null
fi
