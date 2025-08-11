begin
  Rails.logger.info "Booting application – temporary encryption key rescue enabled."
rescue => e
  puts "DEBUG: Skipping due to error: #{e.message}"
end
