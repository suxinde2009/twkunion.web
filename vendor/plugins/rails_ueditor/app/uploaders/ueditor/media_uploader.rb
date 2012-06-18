# encoding: utf-8

class Ueditor::MediaUploader < Ueditor::AssetUploader

  def extension_white_list
    EXT_NAMES[:media]
  end

end

