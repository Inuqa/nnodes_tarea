RSpec.shared_examples 'cron' do
  let(:headers) {}
  let(:do_request) { get request_path, headers: headers }

  context 'with header' do
    let(:headers) { { CheckCronHeader::CRON_HEADER => true } }

    it 'should refill players money' do
      create_object
      expect { do_request }.to change { variable_output.call }.by(variable_amount)
    end
  end
end
