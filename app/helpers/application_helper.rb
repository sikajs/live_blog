module ApplicationHelper
  def is_owner?(author)
    if author_signed_in? && (author == current_author)
      true
    else
      false
    end
  end
end
