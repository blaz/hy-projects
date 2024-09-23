require 'rails_helper'

RSpec.describe UpdateProjectStatus do
  subject(:update_status) do
    UpdateProjectStatus.call(
      user: user,
      new_status: new_status,
      project: project
    )
  end

  let(:project) { FactoryBot.create(:project, status: original_status) }
  let(:original_status) { 'not_started' }
  let(:new_status) { 'in_progress' }

  context 'when the user is added to the project' do
    before do
      project.users << user
    end

    context 'when user is a solicitor' do
      let(:user) { FactoryBot.create(:solicitor) }

      it 'should update the status correctly' do
        expect do
          expect { update_status }.to change(project.reload, :status).from(original_status).to(new_status)
        end
      end

      it 'should create a correct status change record' do
        expect { update_status }.to change { ProjectStatusChange.count }.by(1)

        expect(ProjectStatusChange.last).to have_attributes(
          project: project,
          previous_status: original_status,
          current_status: new_status,
          user: user
        )
      end
    end

    context 'when user is a client' do
      let(:user) { FactoryBot.create(:client) }

      it 'should raise an invalid permission error and the status should not change' do
        expect do
          expect { update_status }.to raise_error(UpdateProjectStatus::InvalidPermissionError)
        end.not_to change(project.reload, :status).from(original_status)
      end
    end

    context 'when user is an agent' do
      let(:user) { FactoryBot.create(:agent) }

      it 'should raise an invalid permission error and the status should not change' do
        expect do
          expect { update_status }.to raise_error(UpdateProjectStatus::InvalidPermissionError)
        end.not_to change(project.reload, :status).from(original_status)
      end
    end
  end

  context 'when the user is not added to the project' do
    context 'when user is a solicitor' do
      let(:user) { FactoryBot.create(:solicitor) }

      it 'should raise an invalid permission error and the status should not change' do
        expect do
          expect { update_status }.to raise_error(UpdateProjectStatus::InvalidPermissionError)
        end.not_to change(project.reload, :status).from(original_status)
      end
    end
  end
end
