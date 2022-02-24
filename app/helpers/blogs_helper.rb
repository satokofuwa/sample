module BlogsHelper

    def choose_new_or_edit
         unless blog.id?
            blogs_path
         else
            blog_path 
         end
         
    end
end
