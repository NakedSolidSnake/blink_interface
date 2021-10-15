all: create_dir copy_files

create_dir:
	mkdir -p build 

copy_files:
	cp business/* build/
	cp platform/arduino/* build/
	cp config/setup/Makefile build/
