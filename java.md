# Useful commands related with Java

## Java

| Description                                      | Command                            |
| ------------------------------------------------ | ---------------------------------- |
| Create a war file                                | `$ jar -xvf sample.war`            |
| Show war content                                 | `$ jar -tf example.war`            |
| Unzip a war file                                 | `$ unzip file.war`                 |
| Unzip a war file especifying the new folder name | `$ unzip yourfile.war -d yourfile` |
| Create a war                                     | `$ jar -cvf projectname.war *`     |

## Maven
| Description                              | Command                                                                                  |
| ---------------------------------------- | ---------------------------------------------------------------------------------------- |
| Build without install skiping all checks | `$ mvn clean package -DskipTests -Dfindbugs.skip=true -Dcheckstyle.skip -Dpmd.skip=true` |
