#!/bin/bash
# Fixing the Junior Admin's 777 mistake
sudo chmod 640 /etc/shadow
sudo chown root:shadow /etc/shadow

# Securing my personal vault
chmod 700 ~/vault
