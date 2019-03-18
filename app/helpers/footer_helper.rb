module FooterHelper

    def current_year
      Time.current.year
    end
  
    def github_url(author, repo, link_name)
      link_to link_name, "https://github.com/#{author}/#{repo}", target: '_blank'
    end
  end