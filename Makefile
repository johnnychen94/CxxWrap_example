.PHONY: configure build

all: configure build

configure:
	mkdir -p build
	cd build && cmake ..

build:
	cd build && make -j$(nproc)

test:
	bash test.sh


