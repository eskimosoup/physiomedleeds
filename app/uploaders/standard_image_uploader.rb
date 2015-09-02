class StandardImageUploader < Chronicler::ImageUploader

  version :index do
    process :resize_and_pad => [240, 140]
  end

  version :show do
    process :resize_to_fill => [479, 275]
  end

end