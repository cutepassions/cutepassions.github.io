module Jekyll
  class PermalinkGenerator < Generator
    safe true

    def generate(site)
      site.pages.each do |page|
        if page.ext == ".md"
          # 파일의 상대 경로를 가져옵니다.
          relative_path = page.path.sub(site.source, "")
          
          # 파일의 디렉토리와 이름을 분리합니다.
          dir = File.dirname(relative_path)
          basename_without_ext = File.basename(page.path, page.ext)

          # permalink를 설정합니다.
          permalink = File.join(dir, basename_without_ext).gsub("\\", "/")

          # 설정된 값을 페이지 데이터에 추가합니다.
          page.data["permalink"] = permalink
        end
      end
    end
  end
end