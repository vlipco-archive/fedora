TARGET_NAME = vlipco/fedora-20

all: clean build install
	@echo
	@echo "---- all ----"
	@echo "Image ready to use in vagrant as $(TARGET_NAME)"

build:
	@echo
	@echo "---- build ----"
	misc/get-box
	packer build fedora-20.json

install:
	@echo
	@echo "---- install ----"
	vagrant box add --name $(TARGET_NAME) boxes/$(TARGET_NAME).box

clean:
	@echo
	@echo "---- clean ----"
	@vagrant box remove $(TARGET_NAME) || echo 'Ignoring...'
