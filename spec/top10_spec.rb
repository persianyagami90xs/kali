require_relative 'spec_helper'

describe 'kali::top10' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-top10]' do
    expect(subject).to install_package('kali-linux-top10').with(timeout: 1800)
  end
end
