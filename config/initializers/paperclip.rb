s3_decision = {
  storage:         :fog,
  path:            ":class/:attachment/:id/:style/:filename",
  fog_credentials: {
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    provider:              'AWS'  
  },
  fog_directory:   ENV['AWS_BUCKET'],
  fog_public:      'public'
}

Paperclip::Attachment.default_options.merge!(s3_decision)
Paperclip.options[:command_path] = ["/usr/local/bin", "/usr/bin"]
