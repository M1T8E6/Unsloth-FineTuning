# Fine-tuning with Unsloth (CUDA / NVIDIA GPU)

This repository contains a notebook and examples to fine-tune large language models using Unsloth (optimized for CUDA/NVIDIA GPUs). The notebook demonstrates loading Unsloth-prepared 4-bit models, applying LoRA adapters, and training with TRL + PEFT.

Contents:
- `notebooks/notebook.ipynb` — step-by-step notebook (model loading, LoRA, training, testing, saving)
- `requirements.txt` — project dependencies (includes `unsloth` and `xformers` pin)

If this repo helped you, please consider starring it ⭐

---

## Requirements
- NVIDIA GPU with CUDA (recommended)
- Python 3.8+
- See `requirements.txt` for full dependency list; main libraries: `unsloth`, `transformers`, `trl`, `peft`, `accelerate`, `bitsandbytes`.

---

## Quick Setup
# Fine-tuning with Unsloth (CUDA / NVIDIA GPU)

This repository contains a notebook and examples to fine-tune large language models using Unsloth (optimized for CUDA/NVIDIA GPUs). The notebook demonstrates loading Unsloth-prepared 4-bit models, applying LoRA adapters, and training with TRL + PEFT.

Contents:
- `notebooks/notebook.ipynb` — step-by-step notebook (model loading, LoRA, training, testing, saving)
- `requirements.txt` — project dependencies (includes `unsloth` and `xformers` pin)

If this repo helped you, please consider starring it ⭐

---

## Requirements
- NVIDIA GPU with CUDA (recommended)
- Python 3.8+
- See `requirements.txt` for full dependency list; main libraries: `unsloth`, `transformers`, `trl`, `peft`, `accelerate`, `bitsandbytes`.

---

## Quick Setup
1. Create and activate a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. (If using gated models) login to Hugging Face:

```bash
pip install huggingface_hub
huggingface-cli login
```

---

## Notebook Quickstart
Open `notebooks/notebook.ipynb` in Jupyter or VS Code and run the cells in order. Highlights:
- Environment check (CUDA/GPU info)
- Model config: set `MODEL_NAME` (notebook default: `unsloth/mistral-7b-bnb-4bit`)
- LoRA config: `LORA_R`, `LORA_ALPHA`, `LORA_DROPOUT`, `TARGET_MODULES`
- Dataset: change `DATASET_NAME` (example uses `yahma/alpaca-cleaned`)
- Training args: `PER_DEVICE_TRAIN_BATCH_SIZE`, `GRADIENT_ACCUMULATION_STEPS`, `NUM_TRAIN_EPOCHS`
- Save: adapters and tokenizer saved to `./fine_tuned_model`

The notebook includes tips for memory/quality tradeoffs and generation examples.

---

## Useful Commands (Makefile)

This project includes a `Makefile` with convenient targets. Examples:

- Prepare environment files and git hooks:

```bash
make prepare-env
```

- Install Python dependencies from `requirements.txt`:

```bash
make install
```

- Run the Streamlit UI (headless on port 8501):

```bash
make run
```

- Login to Hugging Face CLI (if using gated models):

```bash
make login
```

If you need the notebook extras (explicit installs used in the notebook), run them manually:

```bash
pip install "unsloth[colab-new] @ git+https://github.com/unslothai/unsloth.git"
pip install --no-deps "xformers<0.0.27" "trl<0.9.0" peft accelerate bitsandbytes
```

---

## Saving & Loading LoRA Adapters
The notebook shows saving only the LoRA adapters (small on disk) using `model.save_pretrained(SAVE_PATH)` and `tokenizer.save_pretrained(SAVE_PATH)`. Follow the notebook's "Model Testing" section to perform inference with the saved adapters.

---

## Tips & Troubleshooting
- Low GPU memory: reduce `per_device_train_batch_size`, increase `gradient_accumulation_steps`, reduce `MAX_SEQ_LENGTH`, or use a smaller model
- Improve throughput: enable `packing=True` in `SFTTrainer` when appropriate
- Precision: the notebook auto-detects FP16 vs BF16; set `DTYPE` explicitly if needed

---

## Contributing
Contributions welcome — open an issue or submit a PR. For linting/formatting, run repository make targets if available (e.g., `make lint`).

---

## License
Apache-2.0

---

## Acknowledgments
- Hugging Face Transformers, Datasets, Accelerate
- TRL and PEFT (LoRA)
- Unsloth project and community


## Acknowledgments
- Hugging Face Transformers, Datasets, Accelerate
- TRL and PEFT (LoRA)
- Unsloth project and community
