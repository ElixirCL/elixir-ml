defmodule OcrDemo do
  @moduledoc """
  Modulo para realizar OCR sencillo usando Tesseract.
  """

  @doc """
  Procesa una imagen y devuelve el texto extraído.
  """
  def process_image(path) do
    TesseractOcr.read(path)
  end
end
