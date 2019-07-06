require "application_system_test_case"

class ScheduledTransactionsTest < ApplicationSystemTestCase
  setup do
    @scheduled_transaction = scheduled_transactions(:one)
  end

  test "visiting the index" do
    visit scheduled_transactions_url
    assert_selector "h1", text: "Scheduled Transactions"
  end

  test "creating a Scheduled transaction" do
    visit scheduled_transactions_url
    click_on "New Scheduled Transaction"

    fill_in "Account", with: @scheduled_transaction.account_id
    fill_in "Category", with: @scheduled_transaction.category_id
    fill_in "Date", with: @scheduled_transaction.date
    fill_in "Inflow", with: @scheduled_transaction.inflow
    fill_in "Outflow", with: @scheduled_transaction.outflow
    fill_in "Payee", with: @scheduled_transaction.payee_id
    click_on "Create Scheduled transaction"

    assert_text "Scheduled transaction was successfully created"
    click_on "Back"
  end

  test "updating a Scheduled transaction" do
    visit scheduled_transactions_url
    click_on "Edit", match: :first

    fill_in "Account", with: @scheduled_transaction.account_id
    fill_in "Category", with: @scheduled_transaction.category_id
    fill_in "Date", with: @scheduled_transaction.date
    fill_in "Inflow", with: @scheduled_transaction.inflow
    fill_in "Outflow", with: @scheduled_transaction.outflow
    fill_in "Payee", with: @scheduled_transaction.payee_id
    click_on "Update Scheduled transaction"

    assert_text "Scheduled transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheduled transaction" do
    visit scheduled_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheduled transaction was successfully destroyed"
  end
end
