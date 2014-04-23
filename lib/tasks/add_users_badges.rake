desc "Add users Kickstarter badges"
task "add_users_badges" => :environment do
  cnt = 0
  Refinery::User.all.each do |user|
    badge = UserBadge.where(email: user.email, added: false).first

    if badge
        # Assign user badge
        user.user_pledges.create tier_id: badge.tier_id

        # Mark badge as added
        badge.added = true
        badge.save!
        cnt += 1
    end
  end
  Rails.logger.info "=============== DEBUG START ================"
  Rails.logger.info "#{Time.now}: #{cnt} users were assigned!"
  Rails.logger.info "================ DEBUG END ================="
end