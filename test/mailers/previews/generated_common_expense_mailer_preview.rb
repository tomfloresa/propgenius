# Preview all emails at http://localhost:3000/rails/mailers/generated_common_expense_mailer
class GeneratedCommonExpenseMailerPreview < ActionMailer::Preview
  def generated_common_expense_preview
    GeneratedCommonExpenseMailer.generated_common_expense(Renter.first)
  end
end
