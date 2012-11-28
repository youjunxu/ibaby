### Setup the Environment for SQL Server
Go to directory web/src/main/mssql
copy applicationContext-common.xml from mysql directory, and then modify the dataSource bean with sqlserver configure.



### Setup the resources directory

Go to directory web/src/main

#####Unix/Linux
In Unix/Linux we can use ln -s ./mssql ./resouces as sqlserver development.

#####Windows
In Windows platform, you can just copy *mmsql* directory to resouces.
**NOTICE:you can't just rename mssql to resouces.**