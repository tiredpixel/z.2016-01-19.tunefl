ActiveAdmin.register Score do
  
  actions :index, :show, :edit, :update
  
  scope :all, :default => true
  scope :unblocked
  scope :blocked
  
  index do
    column :id
    column :title
    column :composer
    column :copyright
    column :created_at
    
    default_actions
  end
  
  show do |user|
    attributes_table do
      row :id
      row :title
      row :composer
      row :copyright
      row :music
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

