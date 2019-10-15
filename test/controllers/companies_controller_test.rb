# frozen_string_literal: true

require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test 'Admin user can access happy path' do
    user = users(:admin_user)
    company = companies(:company_first)
    happy_path = [companies_path, new_company_path, edit_company_path(company), company_path(company)]

    sign_in user
    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Basic user can acces only show and index' do
    user = users(:basic_user)
    company = companies(:company_first)
    happy_path = [companies_path, company_path(company)]

    sign_in user
    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Valid user can create new company' do
    user = users(:admin_user)
    params = { company: { name: 'company_admin', address: 'Address admin' } }

    sign_in user
    assert_difference 'Company.count' do
      post companies_path(params)
    end
  end

  test 'Invalid user cannot create company' do
    user = users(:basic_user)
    params = { company: { name: 'company_invalid', address: 'Address invalid' } }

    sign_in user
    assert_no_difference 'Company.count' do
      post companies_path(params)
    end
  end

  test 'Valid user can edit company' do
    user = users(:admin_user)
    company = companies(:company_first)

    sign_in user
    put company_path(id: company.id), params: { company: { name: 'company_admin' } }

    assert_response :redirect
    assert_equal 'company_admin', company.reload.name
  end

  test 'Invalid user cannot edit company' do
    user = users(:basic_user)
    company = companies(:company_first)

    sign_in user
    put company_path(id: company.id), params: { company: { name: 'company_admin' } }

    assert_response :redirect
    refute_equal 'company_admin', company.reload.name
  end

  test 'no registered user can access only show and index' do
    company = companies(:company_first)
    happy_path = [companies_path, company_path(company)]

    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Valid user can delete company' do
    user = users(:admin_user)
    company = companies(:company_first)

    sign_in user
    assert_difference 'Company.count', -1 do
      delete company_path(id: company.id)
    end

    assert_response :redirect
  end

  test 'Invalid user cannot delete company' do
    user = users(:basic_user)
    company = companies(:company_first)

    sign_in user
    assert_no_difference 'Company.count' do
      delete company_path(id: company.id)
    end

    assert_response :redirect
  end
end
