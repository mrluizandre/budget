require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @transaction = transactions(:one)
  end

  test "visiting the index" do
    visit transactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "creating a Transaction" do
    visit transactions_url
    click_on "New Transaction"

    fill_in "Account", with: @transaction.account_id
    fill_in "Amount", with: @transaction.amount
    fill_in "Category", with: @transaction.category_id
    fill_in "Date", with: @transaction.date
    fill_in "Payee", with: @transaction.payee_id
    fill_in "Transfer account id", with: @transaction.transfer_account_id_id
    fill_in "Transfer transaction id", with: @transaction.transfer_transaction_id_id
    click_on "Create Transaction"

    assert_text "Transaction was successfully created"
    click_on "Back"
  end

  test "updating a Transaction" do
    visit transactions_url
    click_on "Edit", match: :first

    fill_in "Account", with: @transaction.account_id
    fill_in "Amount", with: @transaction.amount
    fill_in "Category", with: @transaction.category_id
    fill_in "Date", with: @transaction.date
    fill_in "Payee", with: @transaction.payee_id
    fill_in "Transfer account id", with: @transaction.transfer_account_id_id
    fill_in "Transfer transaction id", with: @transaction.transfer_transaction_id_id
    click_on "Update Transaction"

    assert_text "Transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction" do
    visit transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction was successfully destroyed"
  end
end
