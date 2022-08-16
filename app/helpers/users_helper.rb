module UsersHelper
    def form_action_name(user)
        user.new_record? ? 'Sign up!' : 'Update'
    end

    def gravatar_image(user, options={size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{options[:size]}"

        image_tag image_src, alt: user.username , class: "rounded-circle mb-5 shadow mx-auto d-block"
    end

    def joined_time_ago_in_words(user)
        "Joined #{time_ago_in_words(user.created_at)} ago" 
    end
end
