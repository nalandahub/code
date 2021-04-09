[ 'gcc','rpm-build','rpm-devel','rpmlint','make','python','bash','coreutils','diffutils','patch','rpmdevtools'].each do |p|
  yum_package  p do
    action :install
  end
end


rpm_package 'awesome' do
   action :install
   source '/root/.chef/cookbooks/code/awesome-1-1.x86_64.rpm'
  #source can be https://raw.githubusercontent.com/nalandahub/code/main/code/awesome-1-1.x86_64.rpm if it's using URL instead of local file.
end
