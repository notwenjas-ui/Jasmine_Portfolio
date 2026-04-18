# TITAN SMALL BUSINESS SERVICES: SECURITY ARCHITECTURE DOCUMENT (SAD)
**Operator:** Jasmine Newton
**Date:** April 18th, 2026

## 1. Perimeter Hardening (UFW & SSH)
* **SSH Status:** Hardened
/etc/ssh/sshd_config by setting PermitRootLogin no and PasswordAuthentication no to prevent brute-force attcaks
* **Firewall Logic:** Configured UFW to deny all incoming traffic by default, to minimized the attack surace. Only allowing: 
22/tcp (SSH) 
8080/TCP (tITAN wIKI) 

## 2. The Automated Auditor (Python)
* **Script Logic:**

´´´python
import os
DC_IP + "10.0.2.2"
LOG_FILE = "/var/log/dc_audit.log"

def check_dc():
        response = os.system(f"ping -c 4 {DC_IP} > /dev/null 2>&1")
        status = "DC is UP"  if response == 0 else "DC is DOWN"
        with open(LOG_FILE, "a") as f: 
               f.write(status + n)

if name =="main":
check_dc()
´´´
* **Telemetry Path:** `/var/log/sys_audit.log`

## 3. Containerized App (Docker)
* **Network Isolation:** Utilized a dual-network architecture. The 'titan_wiki' container acts as a getaway on both frontend and backend networks, while the 'titan_db'is isolated strictly on the internal backend with no exposed ports, creating "air-gap"from the host.
* **Stack Health:** 
'''
NAME                        IMAGE                           STATUS                    PORTS      
titan_wiki                  nginx:alpine                      Up                      0.0.0.0:8080->80/tcp      
titan_db                    mariadb:10.11                     Up                      (No ports exposed)
''' 

## 4. Executive Summary
The Hardened Outpost utilizes a multi-layered defense- in-depth strategy, securing the perimeter via SSH lockdowns and a restrictive girewall policy. System availability is continuously monitored by a custom Python auditor that provides persistent telemtry on critical infrastructure status. The application environment is architectured for maximum isolation, ensuring that the database remains invisible to external threats through internal container networking.
