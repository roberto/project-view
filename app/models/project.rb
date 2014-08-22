class Project
  include Mongoid::Document

  field :url, type: String
  field :name, type: String
  field :cloned, type: Boolean, default: false
  field :can_be_cloned, type: Boolean, default: true
  
  validates_presence_of :name, :url, :message => ": está vazio"

  has_many :tabs

  before_destroy :delete_directory

  private
  def delete_directory
    system("rm -rf #{@@PATH}/#{project_name}")
  end

end
