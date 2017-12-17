class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :text do |request, content|
    # name = wechat.user(request[:FromUserName])['nickname']

    name = request[:FromUserName]
    Message.create!(:name => name,:content => content)

  end 

  on :text, with: 'help' do |request|
    request.reply.text 'help content' #回复帮助信息
  end

  on :text, with: 'image' do |request|
    first_id = WechatImage.first_id
    last_id = WechatImage.first_id
    img= WechatImage.find(rand(first_id..last_id))
    request.reply.image(img.media_id) #直接将图片返回给用户
  end


  # 处理图片信息
  on :image do |request|
    # request.reply.image(request[:MediaId]) #直接将图片返回给用户
    WechatImage.create!(:media_id=>request[:MediaId],:avatar=>request[:PicUrl].to_s)

    # logger.info {"TEXT=====#{request[:FromUserName]}=======\n" +"=====#{request[:PicUrl]}=======\n"}
  end

  # 处理语音信息
  on :voice do |request|
    request.reply.voice(request[:MediaId]) #直接语音音返回给用户
  end

end
