describe 'minio::default' do
  # Inspec examples can be found at
  # https://docs.chef.io/inspec_reference.html

  it 'starts minio container' do
    expect(command('docker inspect minio').exit_status).to eq 0
  end

  it 'listens on port 80' do
    expect(port(80)).to be_listening
  end
end
