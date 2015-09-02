class TeamMemberImageUploader < Chronicler::ImageUploader

  version :index do
    process :resize_and_pad => [200, 200]
  end

  version :show do
    process :resize_to_fill => [200, 200]
  end

end