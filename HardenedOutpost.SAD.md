1. Perimeter Hardening (Phase 1) 
Objective: To secure a gateway and minimize the attack ssurface.
      - SSH Lockdown: 
         - Set "PermissionRootLogin" no to prevent direct root access
         - Set "PasswordAuthentication no"to enforce key based entry
         - Command Used: sudo systemctl restart ssh
      - UFW Configuration: 
         - Default Policy: Deny Incoming/Allow Outgoing
         - Allowed Ports: 22tc[ (SSH) and 8080/TCP(Web App)
2. The Automated Auditor (Phase2)
Objective: To create an automated watchdog to monitor the status of the Windows Domain Controller
       - Log Location: /var/log/dc_audit.log
3. The Containerized Stack (Phase 3) 
Objective: To deploy a multi-tier application with a secured internal backend. 
Architecture: 
       - Frontend: "titan_wiki"(Nginx) exposed on port 8080
       - Backend: "titan_db"(MariaDB) ISOLATED ON A PRIVATE NETWORK.
       - The Air-Gap: The database container has no port mapping and is connected only to the backend network, making it invisible to the host machine.
