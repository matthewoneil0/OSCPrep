# OSCPrep :ghost:
All tools, scripts, and forks of everything I've used to study and prepare for my OSCP. Below are the tools contained in this repository. I've also included a number of HackTheBox machine walkthroughs I completed in preparation for the exam, all of which were selected from this [list](https://docs.google.com/spreadsheets/d/1dwSMIAPIam0PuRBkCiDI88pU3yzrqqHkDtBngUHNCw8/edit?usp=sharing) of OSCP-like machines. 

- **Quick-map**: Uses Nmap to run a quick scan of the target and subsequently uses the port listing to more granularly scan each service. Ideal for initially identifying ports at the beginning of examining a machine.
- **Quick-C2**: Automatically downloads popular tools such as WinPEAS, PowerUp, and other tools you'd we to retrieve while logged on to a victim machine. I'll likely expand this to a number of other useful tools to have hosted and accessible. 
- **Git-dumper**: Uses basic bash commands to download and rebuild Git repositories which may be unintentionally hosted on victim machines. Specifically useful for web server where a /.git directory id identified. Pulling it down to your local machine helps in examining git logs, etc.
