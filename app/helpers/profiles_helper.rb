module ProfilesHelper
  def current_user_profileimage
    if current_user.profile.profileimage.url == nil
      cl_image_tag "avatar.png", :width => 200, class: "img-thumbnail"
    else
      cl_image_tag(current_user.profile.profileimage.url, :width => 200, class: "img-thumbnail")
    end
  end

  def other_user_profileimage
    if @profile.profileimage.url == nil
      cl_image_tag "avatar.png", :width => 200, class: "img-thumbnail"
    else
      cl_image_tag(@profile.profileimage.url, :width => 200, class: "img-thumbnail")
    end
  end
end
