param(
    [string]$Config = "configs/main/w2v2-exps.yaml",
    [string]$Features = "wav2vec2"
)

# Activate virtual environment
$VenvPython = ".\venv\Scripts\python.exe"

if (-not (Test-Path $VenvPython)) {
    Write-Host "Virtual environment not found! Please ensure venv is created and packages are installed." -ForegroundColor Red
    exit 1
}

Write-Host "Running experiment with Config: $Config and Features: $Features" -ForegroundColor Green

# Run the paip pipeline
& .\venv\Scripts\paiprun.exe $Config --output_path "experiments/run" --mods "global/features=$Features&global/wav2vec2_embedding_layer=local_encoder&global/dienen_config=!yaml configs/dienen/mean_mlp.yaml"
