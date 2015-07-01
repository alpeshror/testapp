module SnippetsHelper
  def get_snippet_url(snippet)
    if snippet.private
      return request.base_url + "/private/#{@snippet.access_token}"
    else
      return request.original_url
    end
  end
end
