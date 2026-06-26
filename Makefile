PYTHON=python3
GREATGRAMPS_CONFIG=config.yml

.PHONY: generate html clean serve deploy

generate:
	$(PYTHON) populate.py

html:
	GREATGRAMPS_CONFIG=$(GREATGRAMPS_CONFIG) grgr build

clean:
	rm -rf www/I*

serve:
	$(PYTHON) -m http.server -d www

deploy:
	git add www
	git commit -amwip
	git push
