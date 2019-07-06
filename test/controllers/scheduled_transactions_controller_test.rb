require 'test_helper'

class ScheduledTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_transaction = scheduled_transactions(:one)
  end

  test "should get index" do
    get scheduled_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_transaction_url
    assert_response :success
  end

  test "should create scheduled_transaction" do
    assert_difference('ScheduledTransaction.count') do
      post scheduled_transactions_url, params: { scheduled_transaction: { account_id: @scheduled_transaction.account_id, category_id: @scheduled_transaction.category_id, date: @scheduled_transaction.date, inflow: @scheduled_transaction.inflow, outflow: @scheduled_transaction.outflow, payee_id: @scheduled_transaction.payee_id } }
    end

    assert_redirected_to scheduled_transaction_url(ScheduledTransaction.last)
  end

  test "should show scheduled_transaction" do
    get scheduled_transaction_url(@scheduled_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_transaction_url(@scheduled_transaction)
    assert_response :success
  end

  test "should update scheduled_transaction" do
    patch scheduled_transaction_url(@scheduled_transaction), params: { scheduled_transaction: { account_id: @scheduled_transaction.account_id, category_id: @scheduled_transaction.category_id, date: @scheduled_transaction.date, inflow: @scheduled_transaction.inflow, outflow: @scheduled_transaction.outflow, payee_id: @scheduled_transaction.payee_id } }
    assert_redirected_to scheduled_transaction_url(@scheduled_transaction)
  end

  test "should destroy scheduled_transaction" do
    assert_difference('ScheduledTransaction.count', -1) do
      delete scheduled_transaction_url(@scheduled_transaction)
    end

    assert_redirected_to scheduled_transactions_url
  end
end
