module Jekyll
  class PermalinkGenerator < Generator
    safe true

    def generate(site)
      site.pages.each do |page|
        if page.ext == ".md"
          # 현재 디렉토리의 Markdown 파일 수를 셉니다.
          md_files_count = Dir.glob(File.join(File.dirname(page.path), "*.md")).size

          # 파일 이름에서 확장자를 제거합니다.
          basename_without_ext = File.basename(page.path, page.ext)

          # permalink를 설정합니다.
          page.data["permalink"] = "/#{md_files_count}/#{basename_without_ext}/"
        end
      end
    end
  end
end