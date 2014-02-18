require 'json'
require 'net/http'
require 'uri'

module Jekyll
  class ImageColumnTag < Liquid::Tag
    @@production = false
    def initialize(tag_name, text, tokens)
      super
      # Using eval okay cause we precompile the site before deploying
      @params = eval('{'+text+'}')

      @params[:cols] ||= 24
      @params[:offset] ||= 0
      @params[:flickr_id] ||= "9131978755"

      @spans = get_flickr_spans(@params[:flickr_id])
    end

    def render(context)
      @@production = context.registers[:site].config['production']
      if @params[:caption].nil?
        img_spans = @spans+"<div style='margin-bottom: 10px;'></div>"
      else
        img_spans = @spans+
          "<div class='text-overlay' style='margin-top: #{@params[:offset]}px;'>
            <i>#{@params[:caption]}</i>
          </div>"
      end
      "<div class='large-#{@params[:cols]} columns image-columns'>#{img_spans}</div>"
    end

    def get_flickr_images(id)
      api_key = "326962bdfea628002a66395ff0fb4251"
      uri = "http://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=#{api_key}&photo_id=#{id}&format=json"
      if @@production == true
        resp = Net::HTTP.get(URI.parse(uri))
        parsed = JSON.parse(resp[14..-2])
        parsed["sizes"]["size"]
      else
        []
      end

    end

    def get_flickr_spans(id)
      images = get_flickr_images(id)
      span = "<span data-picture>"
      if !images[10].nil?
        span += get_flickr_image_span(images[10])
      end
      if @@production == true
        span += get_flickr_image_span(images[9])
        span += get_flickr_image_span(images[8])
        span += get_flickr_image_span(images[7])
        span += get_flickr_image_span(images[6])
        span += get_flickr_image_span(images[5])
        span += get_flickr_image_span(images[4])
        span += get_flickr_image_span(images[3])
      end
      span += "</span>"
      span
    end

    def get_flickr_image_span(image)
      "<span data-src='#{image['source']}' data-media='(min-width: #{image['width']}px)'></span>"
    end
  end

end

Liquid::Template.register_tag('image_column', Jekyll::ImageColumnTag)
