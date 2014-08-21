TARGET_NAME = vlpf-20
JSON_TEMPLATE = vlpf-20.json

virtualbox_clean:
	@echo
	@echo "---- clean ----"
	@vagrant box remove vlipco/$(TARGET_NAME) || echo 'Ignoring...'

virtualbox_build:
	@echo
	@echo "---- build ----"
	misc/get-box
	packer build -only virtualbox-ovf $(JSON_TEMPLATE) 

virtualbox_install:
	@echo
	@echo "---- install ----"
	vagrant box add --name $(TARGET_NAME) boxes/vlipco/$(TARGET_NAME).box

virtualbox_all: virtualbox_clean virtualbox_build virtualbox_install
	@echo
	@echo "---- all ----"
	@echo "Image ready to use in vagrant as $(TARGET_NAME)"

json:
	rm $(JSON_TEMPLATE) || :
	yaml2json < misc/$(TARGET_NAME).yml | jq -r '.' > $(JSON_TEMPLATE)
	packer validate $(JSON_TEMPLATE)

digitalocean: json
	packer build -only digitalocean $(JSON_TEMPLATE)

amazon: json
	packer build -only amazon-ebs $(JSON_TEMPLATE)

.PHONY: json