# Useful commands related with Java

## Maven
| Description                              | Command                                                                                  |
| ---------------------------------------- | ---------------------------------------------------------------------------------------- |
| Build without install skiping all checks | `$ mvn clean package -DskipTests -Dfindbugs.skip=true -Dcheckstyle.skip -Dpmd.skip=true` |