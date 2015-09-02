class BodyPartImageUploader < Chronicler::ImageUploader

  version :index, :from_version => :show do
    process :resize_to_fill => [240, 140]
  end

  version :show do
    process :resize_to_fill => [250, 349]
  end
end