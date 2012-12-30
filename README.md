A web interface using jbaiter's pyomxplayer wrapper to control omxplayer

This particular variation is a web extension using KenT2's work around the the omxplayer wrapper

INSTALLATION
============

This assumes either running Arch or Debian with omxplayer installed

This was developed on archlinux-hf-2012-09-18 with python 2.7

*  install pexpect by following the instructions at www.noah.org/wiki/pexpect
  
*  pyomxplayer is currently included inline in the code as I have made some modifications to KenT2's version, the original can be seen at https://github.com/KenT2/tboplayer and https://github.com/jbaiter/pyomxplayer
  
*  clone this repo into a directory (git clone https://github.com/millerchnz/webomxplayer.git

*  in webomxplayer directory, edit config.py to set the media location, omxoptions ("-o hdmi" for hdmi or "-o local" for RCA output)
  
*  type ./server.py from a terminal opened in webomxplayer directory

*  server.py can be added as daemon to auto start on boot
 
OPERATION
=========

*  point a web browser at the raspberry on the port specified in the config file (8800 by default) http://<raspberry pi>:8800/

*  play videos

