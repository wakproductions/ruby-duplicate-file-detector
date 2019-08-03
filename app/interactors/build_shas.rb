class BuildShas
  include Verbalize::Action

  def call
    FileMetadatum.where(sha1: nil).each do |fd|
    # FileMetadatum.matching_size.each do |fd|
      fd.update(sha1: Digest::SHA1.file(fd.path))
    end
  end
end