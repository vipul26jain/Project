require 'populator'

namespace :db do |variable|
	task populate: :environment do

		Rake::Task['db:migrate:reset'].invoke
		Rake::Task['db:seed'].invoke

		Rake::Task['populate:users'].invoke

end
end