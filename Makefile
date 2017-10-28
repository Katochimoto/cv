documents := $(shell find . -type f -name "*.tex")

MAKEFLAGS+=-j 4

$(documents): %.tex: %.pdf
	mkdir -p build
	pdflatex \
		-synctex=1 \
		-interaction=nonstopmode \
		-file-line-error \
		-output-directory=build \
		-recorder "$@"

clean:
	rm -rf build

.PHONY: $(documents) clean
