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

          # 디렉토리 내 md 파일 개수를 세기
          abs_dir_path = File.join(site.source, dir)
          md_count = Dir.glob(File.join(abs_dir_path, "*.md")).size

          # permalink를 설정합니다: md_count + 1
          permalink = File.join(dir, (md_count + 1).to_s).gsub("\\", "/")

          # 설정된 값을 페이지 데이터에 추가합니다.
          page.data["permalink"] = permalink
        end
      end
    end
  end
end
