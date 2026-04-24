# 1. Descargar audio de prueba
audio_path = "sample.wav"
unless File.exists?(audio_path) do
  IO.puts "📥 Descargando audio de prueba..."
  # Usamos un audio de prueba público
  url = "https://github.com/elixir-nx/bumblebee/raw/main/test/fixtures/audio/sample_16000.wav"
  %{body: body} = Req.get!(url)
  File.write!(audio_path, body)
end

# 2. Ejecutar sensor
IO.puts "🚀 Inicializando Sensor de Audio (Whisper Tiny)..."
IO.puts "   (Esto puede tardar un minuto la primera vez)"
serving = AudioSensor.init()

IO.puts "👂 Transcribiendo audio..."
texto = AudioSensor.transcribir(serving, audio_path)

IO.puts "✅ ÉXITO. El agente escuchó:"
IO.puts "----------------------------------------"
IO.puts texto
IO.puts "----------------------------------------"
