describe 'stories class' do
	context 'stories can' do
		it 'be created using the new action' do
			visit new_story_path
			fill_in 'Name', with: 'Short story'
			fill_in 'Body', with: 'Steve was cock-blocked'
			click_button 'Submit'

			expect(current_path).to match(/stories\/.+/)
			expect(page).to have_content('Short story')
			expect(page).to have_content('Steve was')
		end

		it 'can be given votes' do
			visit new_story_path
			fill_in 'Name', with: 'Short story'
			fill_in 'Body', with: 'Steve was cock-blocked'
			click_button 'Submit'

			click_button 'Up'
			expect(page).to have_content '+1'
		end
	end
end