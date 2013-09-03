module Jekyll
  class ImageRawTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      split_text = text.split(',', 2)
      @url = split_text[0]
      @text = split_text[1]
    end

    def render(context)
      "<div>
         <img src='#{@url}'>
         <div class='text-overlay'>
           #{@text}
         </div>
       </div>"
    end
  end
end

Liquid::Template.register_tag('image_raw', Jekyll::ImageRawTag)
