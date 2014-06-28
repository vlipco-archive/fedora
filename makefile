TARGET_NAME = vlipco/fedora-20

virtualbox_all: virtualbox_clean virtualbox_build virtualbox_install
	@echo
	@echo "---- all ----"
	@echo "Image ready to use in vagrant as $(TARGET_NAME)"

virtualbox_build:
	@echo
	@echo "---- build ----"
	misc/get-box
	packer build --only=virtualbox fedora-20.json

virtualbox_install:
	@echo
	@echo "---- install ----"
	vagrant box add --name $(TARGET_NAME) boxes/$(TARGET_NAME).box

virtualbox_clean:
	@echo
	@echo "---- clean ----"
	@vagrant box remove $(TARGET_NAME) || echo 'Ignoring...'

aws:
	@echo
	@echo "---- aws ----"
	packer build --only=aws fedora-20.json