# Fine-tuning Llama 3.2 with Unsloth

This repository contains notebooks and examples to fine-tune **Llama 3.2 3B** models using **Unsloth**. Unsloth allows for faster and more memory-efficient fine-tuning of LLMs.

## Contents

The `notebooks/` directory contains the following workflows:

- **`LoRA_Llama3_2_3B_4bit.ipynb`**: Demonstrates loading the Llama 3.2 3B model in 4-bit quantization and applying LoRA (Low-Rank Adaptation) for efficient fine-tuning.
- **`QLoRA_Llama3_2_3B.ipynb`**: Focuses on QLoRA (Quantized LoRA) techniques for the Llama 3.2 3B model.

## Requirements

- Python 3.10+
- CUDA-enabled GPU (recommended for Unsloth)
- Dependencies listed in `pyproject.toml`

## Quick Setup

This project uses `uv` for dependency management, but can also be installed via standard `pip`.

### Using uv (Recommended)

1. **Install uv** (if not installed):
   ```bash
   pip install uv
   ```

2. **Create a virtual environment and install dependencies**:
   ```bash
   uv venv
   source .venv/bin/activate
   uv pip install -r pyproject.toml
   ```

### Using standard pip

1. **Create a virtual environment**:
   ```bash
   python -m venv .venv
   source .venv/bin/activate
   ```

2. **Install dependencies**:
   ```bash
   pip install -r pyproject.toml
   ```
   *Note: You may need to install PyTorch manually first depending on your CUDA version.*

## Usage

1. Activate your environment:
   ```bash
   source .venv/bin/activate
   ```

2. Launch Jupyter Lab or Notebook:
   ```bash
   jupyter lab
   ```

3. Open one of the notebooks in the `notebooks/` directory and follow the steps.

## Useful Commands (Makefile)

This project includes a `Makefile` with convenient targets. Examples:

- Prepare environment files:
  ```bash
  make prepare-env
  ```

- Install Python dependencies:
  ```bash
  make install
  ```
  or with uv:
  ```bash
  make uv-install
  ```

## Contributing

Contributions welcome — open an issue or submit a PR.

## License

See the [LICENSE](LICENSE) file for details.
