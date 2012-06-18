# encoding: utf-8

class Ueditor::FlashUploader < Ueditor::AssetUploader

  def extension_white_list
    EXT_NAMES[:flash]
  end

end

