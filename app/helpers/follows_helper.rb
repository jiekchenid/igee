module FollowsHelper
  def follow_to(followable)
    if logged_in? && current_user.following?(followable)
      '已关注 ' + link_to((raw " <span>取消关注?</span>"),follow_path(followable.follows.find_by_user_id(current_user.id)),:method => :delete)
    else  
      link_to("我要关注","#{follows_path}?followable_type=#{followable.class}&followable_id=#{followable.id}",:method => :post)
    end
  end
end
