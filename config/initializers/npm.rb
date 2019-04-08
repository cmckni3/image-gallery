if Rails.env.development? || Rails.env.test?
  system 'which yarn'
  yarn_available = $?.success?

  package_installer_command = yarn_available ? 'yarn install' : 'npm install'
  system package_installer_command
end
