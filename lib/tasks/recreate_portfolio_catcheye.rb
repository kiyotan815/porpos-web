Portfolio.find_each do |portfolio|
  begin
    p portfolio.id
    portfolio.catcheye_img.recreate_versions! if portfolio.catcheye_img.present?
    portfolio.save!
  rescue
    p "#{portfolio.id} recreate failed."
  end
end

User.find_each do |user|
  begin
    p user.id
    user.icon_img.recreate_versions! if user.icon_img.present?
    user.save!
  rescue
    p "#{user.id} recreate failed."
  end
end
