.PHONY: all build deploy

PYTHON_VERSION := 3.11
REQUIREMENTS := requirements.txt
CONTENTS_DIR := content
OUTPUT_DIR := dist

all: build deploy

# Target to set up the environment and install dependencies
setup:
	python -m pip install -r $(REQUIREMENTS)

# Target to build the JupyterLite site
build: setup
	cp README.md $(CONTENTS_DIR)
	jupyter lite build --contents $(CONTENTS_DIR) --output-dir $(OUTPUT_DIR)


# Clean target to remove build artifacts
clean:
	rm -rf $(OUTPUT_DIR)
