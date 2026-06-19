PYTHON=python3
GREATGRAMPS_CONFIG=config.yml

.PHONY: generate html pdf clean serve deploy

generate:
	$(PYTHON) populate.py

html:
	GREATGRAMPS_CONFIG=$(GREATGRAMPS_CONFIG) grgr build

pdf:
	GREATGRAMPS_CONFIG=$(GREATGRAMPS_CONFIG) grgr pdf ancestors I0000 6 www/ancestors.pdf --color --paper A4
	GREATGRAMPS_CONFIG=$(GREATGRAMPS_CONFIG) grgr pdf descendants I0000 3 www/descendants.pdf --color --paper A4
	GREATGRAMPS_CONFIG=$(GREATGRAMPS_CONFIG) grgr pdf hourglass I0000 6 3 www/hourglass.pdf --color --paper A4

clean:
	rm -rf www/I*

serve:
	$(PYTHON) -m http.server -d www

deploy:
	git add www
	git commit -amwip
	git push
