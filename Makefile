CURRDIR=$(shell pwd)
VENDORDIR=$(CURRDIR)/assets/vendor

.PHONY: build

build: $(VENDORDIR)
	@cp node_modules/jquery/dist/jquery.min.js $(VENDORDIR)
	@cp node_modules/popper.js/dist/umd/popper.min.js $(VENDORDIR)
	@cp node_modules/bootstrap/dist/js/bootstrap.min.js $(VENDORDIR)

$(VENDORDIR):
	@mkdir -p $(VENDORDIR)

