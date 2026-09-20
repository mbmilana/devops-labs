#!/bin/bash
sudo apt update
ps aux | grep [c]ron
ps aux --sort=-%mem | head -6
