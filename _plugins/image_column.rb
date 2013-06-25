module Jekyll
  class ImageColumnTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      split_text = text.split(',', 4)
      @num_cols = split_text[0]
      @url = split_text[1]
      @offset = split_text[2]
      @text = split_text[3] 
    end

    def render(context)
      if @text.nil?
        img_src = "<img src='#{@url}' style='margin-bottom: 10px;'>"
      else
        img_src = "<img src='#{@url}'>
         <div class='text-overlay' style='margin-top: #{@offset}px;'>
           #{@text}
         </div>"
      end
      "<div class='large-#{@num_cols} columns image-columns'>#{img_src}</div>"
    end
  end

end

Liquid::Template.register_tag('image_column', Jekyll::ImageColumnTag)

