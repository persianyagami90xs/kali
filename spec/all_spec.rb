require_relative 'spec_helper'

describe 'kali::all' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-all]' do
    expect(subject).to install_package('kali-linux-all').with(timeout: 1800)
  end
end
