RSpec.shared_examples 'cron' do
  let(:headers) {}
  let(:do_request) { get request_path, headers: headers }

  context 'with header' do
    let(:headers) { { CheckCronHeader::CRON_HEADER => true } }

    it 'should change the output' do
      create_object
      expect { do_request }.to change { variable_output.call }.by(variable_amount)
    end

    it do
      do_request
      expect(response).to have_http_status(:ok)
    end
  end

  context 'without header' do
    it 'should change the output' do
      create_object
      expect { do_request }.not_to(change { variable_output.call })
    end

    it do
      do_request
      expect(response).to have_http_status(:internal_server_error)
    end
  end
end
