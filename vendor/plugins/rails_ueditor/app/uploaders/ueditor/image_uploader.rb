# encoding: utf-8

class Ueditor::ImageUploader < Ueditor::AssetUploader

  def extension_white_list
    EXT_NAMES[:image]
  end

end

