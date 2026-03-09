module Jekyll
  module ObsidianEmbeds
    class Generator < Jekyll::Generator
      safe true
      priority :high

      def generate(site)
        @site = site

        process_documents(site.posts.docs)
        process_documents(site.pages)
        site.collections.each do |name, collection|
          process_documents(collection.docs) unless name == 'posts'
        end
      end

      private

      def process_documents(documents)
        documents.each do |doc|
          process_wikilinks(doc)
        end
      end

      def process_wikilinks(document)
        return unless document.content

        document.content.gsub!(/!\[\[([^\]]+)\]\]/) do |match|
          filename = $1
          convert_embed(document, filename)
        end

        if document.data['excerpt']
          document.data['excerpt'].content.gsub!(/!\[\[([^\]]+)\]\]/) do |match|
            filename = $1
            convert_embed(document, filename)
          end
        end
      end

      def convert_embed(document, filename)
        ext = File.extname(filename).downcase

        doc_dir = File.dirname(document.relative_path)
        doc_dir = doc_dir.sub(/^_posts/, 'post-assets')

        media_path = File.join(doc_dir, 'files', filename)
        web_path = "/#{media_path}".gsub('\\', '/')

        case ext
        when '.mp4', '.webm'
          "<video controls><source src=\"#{web_path}\" type=\"video/#{ext[1..]}\"></video>"
        when '.mp3', '.wav', '.ogg'
          "<audio controls><source src=\"#{web_path}\" type=\"audio/#{ext[1..]}\"></audio>"
        when '.png', '.jpg', '.jpeg', '.gif', '.webp', '.svg'
          "![](#{web_path})"
        else
          "[#{filename}](#{web_path})"
        end
      end
    end
  end
end

