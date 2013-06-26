module Jekyll
  class ImageColumnTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @params = eval('{'+text+'}')
      @params[:cols] ||= 20
      @params[:offset] ||= 0
    end

    def render(context)
      if @params[:caption].nil?
        img_src = "<img src='#{@params[:url]}' style='margin-bottom: 10px;'>"
      else
        img_src = "<img src='#{@params[:url]}'>
          <div class='text-overlay' style='margin-top: #{@params[:offset]}px;'>
            #{@params[:caption]}
          </div>"
      end
      "<div class='large-#{@params[:cols]} columns image-columns'>#{img_src}</div>"
    end
  end

end

Liquid::Template.register_tag('image_column', Jekyll::ImageColumnTag)
