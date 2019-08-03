class RemoveFile
  include Verbalize::Action

  TRASH_PATH = File.join(Dir.pwd, 'trashbin')

  input :path

  def call
    # File.mv()
  end
end