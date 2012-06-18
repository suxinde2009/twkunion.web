Rails.application.routes.draw do
  namespace :ueditor do
    post "/upload" => "assets#create"
    get  "/filemanager" => "assets#list"
  end
end