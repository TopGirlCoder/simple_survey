# rails db:seed (or created alongside the database with db:setup)

users = User.create([
	{ email: 'test1@test.com', password: 'password' }, 
	{ email: 'test2@test.com', password: 'password' },
	{ email: 'test3@test.com', password: 'password' }
])

surveys = Survey.create([
	{ question: 'Do you like going to the Monterey Bay Aquarium?', surveyor: users.first }, 
	{ question: 'Do you like mountain biking on the trails near Skyline?', surveyor: users.first },
	{ question: 'Do you like hiking along the coast at Pigeon Point Lighthouse?', surveyor: users.last },
	{ question: 'Do you like sailing in the San Francisco Bay?', surveyor: users.last }
])

votes = Vote.create([
	{ value: 1, survey_id: '1', voter_id: '1' }, 
	{ value: 0, survey_id: '1', voter_id: '2' }, 
	{ value: 0, survey_id: '1', voter_id: '3' }, 
	
	{ value: 1, survey_id: '2', voter_id: '1' }, 
	{ value: 1, survey_id: '2', voter_id: '2' }, 
	{ value: 1, survey_id: '2', voter_id: '3' }, 
	
	{ value: 0, survey_id: '3', voter_id: '1' }, 
	{ value: 1, survey_id: '3', voter_id: '2' }, 
	{ value: 1, survey_id: '3', voter_id: '3' }, 
	
	{ value: 0, survey_id: '4', voter_id: '1' }, 
	{ value: 0, survey_id: '4', voter_id: '2' }, 
	{ value: 0, survey_id: '4', voter_id: '3' } 
])