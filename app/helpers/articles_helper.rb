module ArticlesHelper
    def created_time_ago_in_words(article)
        "created #{time_ago_in_words(article.created_at)} ago"
    end

    def edited_time_ago_in_words(article)
        "edited #{time_ago_in_words(article.updated_at)} ago"
    end

    def created_edited_time_ago_in_words(article)
        "#{created_time_ago_in_words(article)}, #{edited_time_ago_in_words(article)}"
    end
end
