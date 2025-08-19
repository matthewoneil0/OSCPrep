# OSCPrep :ghost:
All tools, scripts, and forks of everything I've used to study and prepare for my OSCP. Below are the tools contained in this repository. I've also included a number of HackTheBox machine walkthroughs I completed in preparation for the exam, all of which were selected from this [list](https://docs.google.com/spreadsheets/d/1dwSMIAPIam0PuRBkCiDI88pU3yzrqqHkDtBngUHNCw8/edit?usp=sharing) of OSCP-like machines. 

- **Quick-map**: Uses Nmap to run a quick scan of the target and subsequently uses the port listing to more granularly scan each service. Ideal for initially identifying ports at the beginning of examining a machine.
- **Quick-C2**: Automatically downloads popular tools such as WinPEAS, PowerUp, and other tools you'd want to retrieve while logged on to a victim machine. I'll likely expand this to a number of other useful tools to have hosted and accessible. 
- **Git-dumper**: Uses basic bash commands to download and rebuild Git repositories that may be unintentionally hosted on victim machines. Specifically useful for a web server where a /.git directory is identified. Pulling it down to your local machine helps in examining git logs, etc.

## Useful links I kept coming back to
**References**
- [Pentest Monkey Reverse Shell Cheat Sheet](https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet)

**Wordlists**
- [Directory Traversal Paths](https://github.com/omurugur/Path_Travelsal_Payload_List/blob/master/Payload/Dp.txt)
- [SQL Injection Strings](https://github.com/payloadbox/sql-injection-payload-list)
