class FileMetadatum < ApplicationRecord

  def self.matching_sha1
    where(file_size:
      FileMetadatum.select(:sha1).group(:sha1).having('count(sha1) > 1').map { |m| m.sha1 }
    ).order(:sha1, :path).to_a
  end

  def self.matching_size
    where(file_size:
      FileMetadatum.select(:file_size).group(:file_size).having('count(file_size) > 1').map { |m| m.file_size }
    )
  end
end
