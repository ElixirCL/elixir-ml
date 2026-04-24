# 1. Descargar imagen de prueba
img_path = "bee.jpg"
IO.puts "📥 Descargando imagen de prueba (Abeja)..."
url = "https://huggingface.co/datasets/huggingface/documentation-images/resolve/main/bee.jpg"
%{status: 200, body: body} = Req.get!(url)
File.write!(img_path, body)

# 2. Ejecutar sensor
IO.puts "🚀 Inicializando Sensor de Visión (ResNet)..."
serving = VisionSensor.init()

IO.puts "🔍 Clasificando imagen..."
predicciones = VisionSensor.clasificar(serving, img_path)

IO.puts "✅ ÉXITO. Resultados:"
Enum.each(predicciones, fn %{label: label, score: score} ->
  IO.puts "   - #{label}: #{Float.round(score * 100, 2)}%"
end)
