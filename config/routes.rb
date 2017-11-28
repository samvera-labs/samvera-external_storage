ExternalStorage::Engine.routes.draw do
  post '/concern/file_sets/:id/stage' => 'hyrax/file_sets#stage', as: :stage_external_file
end
