module BlogsHelper

    def choose_new_or_edit
         unless blog.id?
            blogs_path
         else
            blo
    end
end
