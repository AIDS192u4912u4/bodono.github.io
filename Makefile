DOCS=index publications software photography teaching

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix html/, $(HDOCS))

.PHONY: default
default: docs

.PHONY : docs update
update : $(PHDOCS)
	@printf 'Copying to (hidden) server...\n'
	@rsync -a --delete --copy-unsafe-links *.jemdoc html/* bodono@bodonoghue.org:~/bodonoghue.org/
	@echo ' done.'

docs : $(PHDOCS)
html/%.html : %.jemdoc MENU
	@printf 'Running jemdoc\n'
	./jemdoc -c bodonoghue.conf -o $@ $< 

.PHONY : clean
clean :
	-rm -f html/*.html

