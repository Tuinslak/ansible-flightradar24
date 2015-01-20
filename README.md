Flightradar24 Ansible playbook
==============================

A simple Ansible playbook for Flightradar nodes.

More at [yeri.be/flightradar24-ansible-playbook](https://flightradar24-ansible-playbook)

Features
========

* Download & install all components
* Autostart FR24 at boot
* Some tools to monitor the device (customise these in your own environment)

Requirements
============

This requires a basic working Linux system. While most dependencies are installed, some might be missing. I'll commit my Ansible playbook at a later stage that fetches all tools required. 

Manual labour
=============

* Be sure to edit `/root/flightradar24.sh` with your key. 
* Be sure to [set the](https://github.com/Tuinslak/anisble-flightradar24/blob/master/site.yml) `fr24_url` to your architecture and to the latest version: [RPi]](http://feed.flightradar24.com/raspberry-pi/) & [Linux](http://feed.flightradar24.com/linux/).  

Todo
====

* Every Ansible run it recompiles everything. I guess that's not really needed.
* It also runs as root... But whatevs? 

Misc
====

I am running these FR24 nodes using [EfikaMX](https://en.wikipedia.org/wiki/Efika#Efika_MX) devices. This could also work on Raspberry Pi's.
