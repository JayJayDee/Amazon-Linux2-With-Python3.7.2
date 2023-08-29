# Amazon-Linux2-With-Python3.7.2
Dockerfile for AmazonLinux2 + Python3.7.x

## Changing Python Version
Adjust the version environment variables. 
- `PYTHONVER`: Full version name. e.g. 3.7.2
- `PYSHORT`: Short version name e.g. 3.7 

## How to build 
```bash
docker build -t amzn-python-372 .
```