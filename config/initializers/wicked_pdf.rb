# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md
if Rails.env.production?
  WickedPdf.config = {
    exe_path: '/usr/local/rvm/gems/ruby-2.3.0/bin/wkhtmltopdf',
    page_size: 'Letter'
  }
end

if Rails.env.development?
  WickedPdf.config = {
    exe_path: '/Users/tomfloresa/.rvm/gems/ruby-2.3.3/bin/wkhtmltopdf',
    page_size: 'Letter'
  }
end
