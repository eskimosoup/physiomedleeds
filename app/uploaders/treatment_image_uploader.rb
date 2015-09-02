class TreatmentImageUploader < Chronicler::ImageUploader

  version :index, :from_version => :show do
    process :resize_to_fill => [240, 140]
  end

  version :show do
    process :resize_to_fill => [408, 290]
  end
end