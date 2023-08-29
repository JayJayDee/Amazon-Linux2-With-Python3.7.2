FROM amazonlinux:2

ENV PYSHORT 3.7
ENV PYTHONVER 3.7.2
RUN yum -y install clang git wget zip libusb libusb-devel cmake bzip2-devel ncurses-devel gdbm-devel xz-devel sqlite-devel openssl-devel tk-devel uuid-devel readline-devel zlib-devel libffi-devel && yum groupinstall -y "Development Tools"

WORKDIR /tmp

RUN wget --no-check-certificate https://www.python.org/ftp/python/${PYTHONVER}/Python-${PYTHONVER}.tgz
RUN tar -zxvf Python-${PYTHONVER}.tgz

WORKDIR /tmp/Python-${PYTHONVER}
RUN ./configure --prefix=/usr/local LDFLAGS="-Wl,-rpath /usr/local/lib" --with-ensurepip=install
RUN make && make altinstall
RUN pip${PYSHORT} install pip --upgrade && pip${PYSHORT} install virtualenv

WORKDIR /root
RUN rm -r /tmp/Python-${PYTHONVER}
RUN ln -s /usr/local/bin/python3.7 /usr/local/bin/python3