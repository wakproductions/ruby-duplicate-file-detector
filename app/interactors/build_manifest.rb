class BuildManifest
  include Verbalize::Action

  DEFAULT_FILE_FILTERS=['*.mp4', '*.webm']

  DEFAULT_FILE_SEARCH_PATHS=[
    '/Volumes/WD Passport 25E2/Youtube-Download-Channels',
    '/Volumes/WD Passport 25E2/Youtube-Download-Oneoff',
    '/Volumes/WD Passport 25E2/Youtube-Download-Playlists',
    '/Volumes/VideoArchive2 1/Youtube-Download-Channels',
    '/Volumes/VideoArchive2 1/Youtube-Download-Playlists',
    '/Volumes/VideoArchive2 1/Youtube-Topic-Oneoff-Downloads',
  ]

  input optional: [:file_search_paths, :file_filters]

  def call
    file_search_paths.each do |fsp|
      complete_file_list = file_filters.each do |filename_filter|
        Dir.glob("#{fsp}/**/#{filename_filter}")
      end

      complete_file_list.map do |file_path|
        next unless File.file?(file_path)
        puts "Indexing #{file_path}"
        # [file_path, Digest::SHA1.file(file_path)]
        FileMetadatum.create(
          path: file_path,
          file_size: File.size(file_path),
        )
      end
    end
  end

  private

  def file_filters
    @file_filters || DEFAULT_FILE_FILTERS
  end

  def file_search_paths
    @file_search_paths || DEFAULT_FILE_SEARCH_PATHS
  end

end