PYTHON=/home/ben/.virtualenvs/gramps/bin/python
GRGR=/home/ben/.virtualenvs/gramps/bin/grgr
GREATGRAMPS_CONFIG=config.yml

.PHONY: generate clean html serve deploy

generate:
	$(PYTHON) populate.py

clean:
	rm -rf www/I*

html:
	GREATGRAMPS_CONFIG=$(GREATGRAMPS_CONFIG) $(GRGR) build

serve:
	$(PYTHON) -m http.server --directory www

deploy:
	git add www
	git commit -amwip
	git push
