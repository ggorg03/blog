module UsersHelper
    def form_action_name(user)
        user.new_record? ? 'Sign up!' : 'Update'
    end
end
