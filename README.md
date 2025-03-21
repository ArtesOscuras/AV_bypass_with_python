# Antivirus Bypass with Python

## Description
This project is a simple ofuscator for python scripts. Also include a couple of scripts in bash to compile your python script and sign it with a self-signed certificate.

## Install
Instructions to proceed:
```bash
# Clone rep
git clone https://github.com/ArtesOscuras/AV_bypass_with_python.git

# Go inside
cd AV_bypass_with_python

# Install dependencies
sudo apt install wine
wget https://www.python.org/ftp/python/3.9.0/python-3.9.0-amd64.exe
wine python-3.9.0-amd64.exe
wine pip install pyinstaller
sudo apt install osslsigncode
```

## Usage:
Example how tu use it:
```bash
python3 ofuscator.py mininetcat.py #(or any other python script you want to ofuscate)

# IMPORTANT NOTE: Use the command WINECFG to set your wine, in a Windows Vista, or any old windows before compile your script.
This simple trick will safe you from hundreds of incompatibility problems.

chmod +x compile.sh
./compile.sh mininetcat.py

 chmod +x sign.sh
./sign.sh mininetcat.exe
```

## Youtube Channel
This prove of concept is from www.youtube.com/@artes_oscuras channel. You can take a look at my videos if you like cybersecurity


