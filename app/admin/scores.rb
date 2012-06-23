ActiveAdmin.register Score do
  
  actions :index, :show, :edit, :update
  
  scope :all, :default => true
  scope :pending
  scope :usable
  scope :unusable
  scope :unblocked
  scope :blocked
  
  index do
    column :id
    column :title
    column :composer
    column :copyright
    column :music
    column :preview
    column :midi
    column :usable
    column :created_at
    
    default_actions
  end
  
  show do |score|
    attributes_table do
      row :id
      row :title
      row :composer
      row :copyright
      row :music
      row :preview do
        link_to(score.preview.url, score.preview.url)
      end
      row :preview do
        image_tag(score.preview.url)
      end
      row :midi do
        link_to(score.midi.url, score.midi.url)
      end
      row :usable
      row :blocked
      row :created_at
      row :updated_at
    end
  end
  
  form do |f|
    f.inputs do
      f.input :blocked
    end
    
    f.buttons
  end
  
end

