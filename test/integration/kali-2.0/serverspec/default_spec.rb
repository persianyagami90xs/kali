# -*- coding: utf-8 -*-

require 'serverspec'
set :backend, :exec

describe file('/etc/apt/sources.list.d/kali.list') do
  it { should be_file }

  [%r{deb-src "https://http.kali.org/kali" sana main non-free contrib},
   %r{deb *"https://http.kali.org/kali" sana main non-free contrib}].each do |m|
    its(:content) { should match(m) }
  end
end

describe file('/etc/apt/sources.list.d/kali-security.list') do
  it { should be_file }
  its(:content) do
    should match(
      %r{deb *"https://security.kali.org/kali-security" sana/updates*}
    )
  end
end

describe file('/etc/apt/preferences.d/kali.pref') do
  it { should be_file }
  its(:content) { should match(/Package: \*/) }
  its(:content) { should match(/Pin: origin http\.kali\.org/) }
  its(:content) { should match(/Pin-Priority: 700/) }
end

describe package('kali-linux') do
  it { should be_installed }
end
