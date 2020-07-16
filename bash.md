# Useful Bash commands

| Command                                                     | Description                                                      |
| ----------------------------------------------------------- | ---------------------------------------------------------------- |
| `$ ssh-keygen -t rsa -C "<SOME_EMAIL_HERE>"`                | Create SSH KEY                                                   |
| `$ ssh-add -K ~/.ssh/id_rsa`                                | Includes the key in the ssh-agent                                |
| `$ netstat -vanp tcp \| grep 8080`                          | Verify applications running on X port                            |
| `$ sudo lsof -i tcp:8080`                                   | Verify applications running on X port                            |
| `$ ls -d */`                                                | List all directories                                             |
| `$ find . -type d -ls`                                      | List all directories from the current position                   |
| `$ unalias -a`                                              | Delete all user alias                                            |
| `$ zip -r file.zip directoryToZip`                          | zip a directory                                                  |
| `$ ls *.png \| wc -l`                                       | Count files by extension                                         |
| `$ find . -type f \| sed -n 's/..*\.//p'\| sort \| uniq -c` | Count all files grouping by type                                 |
| `$ df`                                                      | disk free from metadata                                          |
| `$ du -sm /* (sum dirs)`                                    | Check disk space                                                 |
| `$ find . -d -name '.git'`                                  | List all directories from the current one with the giving name   |
| `$ rm -rf "find . -d -name '.git'"`                         | Remove all directories from the current one with the giving name |