### Setup Gitignore file
Go to current directory, create file .gitignore, with content as following:

    # fixed file #
    .gitignore
    *.exe
    *.class
    *.o
    *.obj
    *.dbg

    # temp file
    ~*
    *.log
    *.tmp
    .DS_Store

    .*

    *.iml
    *.ipr
    *.iws

    /web/target/
    /web/src/main/resources


### Setup the resources directory

Go to directory web/src/main

#####Unix/Linux
In Unix/Linux we can use ln -s ./sqlserver ./resouces as sqlserver development.

#####Windows
In Windows platform, you can just copy sqlserver directory to resouces.
NOTICE:you can't just rename sqlserver to resouces.