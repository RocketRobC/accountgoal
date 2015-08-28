module ApplicationHelper
  def user_nav_avatar
    if current_user.profile.profileimage.url == nil
      cl_image_tag "avatar.png", :width => 30, :height => 30, :crop => :thumb, :gravity => :face, :radius => :max
    else
      cl_image_tag(current_user.profile.profileimage, :width => 30, :height => 30, :crop => :thumb, :gravity => :face, :radius => :max)
    end
  end

  def other_user_avatar

  end

end
