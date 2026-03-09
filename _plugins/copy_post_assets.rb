Jekyll::Hooks.register :site, :post_write do |site|
  # Find all files in _posts directory that aren't markdown
  posts_dir = File.join(site.source, '_posts')

  Dir.glob(File.join(posts_dir, '**/*')).each do |file|
    next if File.directory?(file)
    next if file.end_with?('.md', '.markdown', '.html')

    # Get relative path from _posts
    relative_path = file.sub(posts_dir + '/', '')

    # Copy to _site/post-assets/
    dest_dir = File.join(site.dest, 'post-assets', File.dirname(relative_path))
    FileUtils.mkdir_p(dest_dir)
    FileUtils.cp(file, File.join(dest_dir, File.basename(file)))
  end
end

