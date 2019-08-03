class ReportsController < ApplicationController

  def index
    @files = FileMetadatum.matching_sha1
  end

  def destroy
    @file = FileMetadatum.find_by(id: params[:id])

    RemoveFile.call(path: @file.path)
  end
end
