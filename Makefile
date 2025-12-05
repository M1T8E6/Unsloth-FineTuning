LLVM_PREFIX := $(shell if command -v brew >/dev/null 2>&1; then brew --prefix llvm; elif command -v llvm-config >/dev/null 2>&1; then llvm-config --prefix; else echo /usr; fi)

prepare-env:
	./scripts/prepare-env.sh

install:
	CC=$(LLVM_PREFIX)/bin/clang \
	CXX=$(LLVM_PREFIX)/bin/clang++ \
	LDFLAGS="-L$(LLVM_PREFIX)/lib -Wl,-rpath,$(LLVM_PREFIX)/lib" \
	CPPFLAGS="-I$(LLVM_PREFIX)/include" \
	pip install -r pyproject.toml

uv-install:
	CC=$(LLVM_PREFIX)/bin/clang \
	CXX=$(LLVM_PREFIX)/bin/clang++ \
	LDFLAGS="-L$(LLVM_PREFIX)/lib -Wl,-rpath,$(LLVM_PREFIX)/lib" \
	CPPFLAGS="-I$(LLVM_PREFIX)/include" \
	uv pip install -r pyproject.toml

login:
	huggingface-cli login

run:
	streamlit run app.py --server.port 8501 --server.headless true

lint:
	pylint app --fail-under=9.0 --fail-on=E
