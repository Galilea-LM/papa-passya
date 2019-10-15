# frozen_string_literal: true

require 'test_helper'

class SpacesControllerTest < ActionDispatch::IntegrationTest
  test 'Admin user can access happy path' do
    user = users(:admin_user)
    space = spaces(:space_example)
    happy_path = [spaces_path, new_space_path, edit_space_path(space), space_path(space)]

    sign_in user
    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Valid user can delete space' do
    user = users(:admin_user)
    space = spaces(:space_example)

    sign_in user
    assert_difference 'Space.count', -1 do
      delete space_path(id: space.id)
    end

    assert_response :redirect
  end

  test 'Valid user can edit space' do
    user = users(:admin_user)
    space = spaces(:space_example)

    sign_in user
    put space_path(id: space.id), params: { space: { name: 'space_admin' } }

    assert_response :redirect
    assert_equal 'space_admin', space.reload.name
  end

  test 'Valid user can create new space' do
    user = users(:admin_user)
    params = { space: { name: 'space_admin', address: Date.today, place: 'place', description: 'space new' } }

    sign_in user
    assert_difference 'Space.count' do
      post spaces_path(params)
    end
  end

  test 'Basic user can acces only show and index' do
    user = users(:basic_user)
    space = spaces(:space_example)
    happy_path = [spaces_path, space_path(space)]

    sign_in user
    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Invalid user cannot create space' do
    user = users(:basic_user)
    params = { space: { name: 'space_admin', address: Date.today, place: 'place', description: 'space new' } }

    sign_in user
    assert_no_difference 'Space.count' do
      post spaces_path(params)
    end
  end

  test 'Invalid user cannot edit space' do
    user = users(:basic_user)
    space = spaces(:space_example)

    sign_in user
    put space_path(id: space.id), params: { space: { name: 'space_admin' } }

    assert_response :redirect
    refute_equal 'space_admin', space.reload.name
  end

  test 'no registered user can access only show and index' do
    space = spaces(:space_example)
    happy_path = [spaces_path, space_path(space)]

    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Invalid user cannot delete space' do
    user = users(:basic_user)
    space = spaces(:space_example)

    sign_in user
    assert_no_difference 'Space.count' do
      delete space_path(id: space.id)
    end

    assert_response :redirect
  end
end
