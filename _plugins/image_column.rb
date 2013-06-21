module Jekyll
  class ImageColumnTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      split_text = text.split(',', 3)
      @num_cols = split_text[0]
      @url = split_text[1]
      @text = split_text[2] 
    end

    def render(context)
      "<div class='large-#{@num_cols} columns image-columns'>
         <img src='#{@url}'>
         <div class='text-overlay'>
           #{@text}
         </div>
       </div>"
    end
  end
end

Liquid::Template.register_tag('image_column', Jekyll::ImageColumnTag)
