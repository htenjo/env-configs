# Useful Bash commands

| Description                           | Command                                      |
| ------------------------------------- | -------------------------------------------- |
| Create SSH KEY                        | `$ ssh-keygen -t rsa -C "<SOME_EMAIL_HERE>"` |
| Includes the key in the ssh-agent     | `$ ssh-add -K ~/.ssh/id_rsa`                 |
| Verify applications running on X port | `$ netstat -vanp tcp | grep 8080`            |
| Verify applications running on X port | `$ sudo lsof -i tcp:8080`                    |