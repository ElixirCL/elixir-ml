image_path = "C:/Users/USER/.gemini/antigravity/brain/2f198be2-0bf3-43c4-be5c-528cfd1e90d0/ocr_test_text_1776661518382.png"
IO.puts("Procesando imagen: #{image_path}")
resultado = OcrDemo.process_image(image_path)
IO.puts("Resultado OCR:")
IO.puts("-----------------")
IO.puts(resultado)
IO.puts("-----------------")
