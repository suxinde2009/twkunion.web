# encoding: utf-8

class Ueditor::FileUploader < Ueditor::AssetUploader

  def extension_white_list
    EXT_NAMES[:file]
  end

end