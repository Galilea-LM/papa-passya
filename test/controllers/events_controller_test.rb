# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'Admin user can access happy path' do
    user = users(:admin_user)
    event = events(:event_example)
    happy_path = [events_path, new_event_path, edit_event_path(event), event_path(event)]

    sign_in user
    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Basic user can acces only show and index' do
    user = users(:basic_user)
    event = events(:event_example)
    happy_path = [events_path, event_path(event)]

    sign_in user
    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Valid user can create new event' do
    user = users(:admin_user)
    company = companies(:company_first)
    space = spaces(:space_example)
    params = { event: { name: 'event_admin', date_start: Date.today,
                        date_end: Date.today, date: '2019-10-04 18:39:51', description: 'event new',
                        company_id: company.id, space_id: space.id } }

    sign_in user
    assert_difference 'Event.count' do
      post events_path(params)
    end
  end

  test 'Invalid user cannot create event' do
    user = users(:basic_user)
    company = companies(:company_first)
    space = spaces(:space_example)
    params = { event: { name: 'event_admin', date_start: Date.today,
                        date_end: Date.today, date: '2019-10-04 18:39:51', description: 'event new',
                        company_id: company.id, space_id: space.id } }

    sign_in user
    assert_no_difference 'Event.count' do
      post events_path(params)
    end
  end

  test 'Valid user can edit event' do
    user = users(:admin_user)
    event = events(:event_example)

    sign_in user
    put event_path(id: event.id), params: { event: { name: 'event_admin' } }

    assert_response :redirect
    assert_equal 'event_admin', event.reload.name
  end

  test 'Invalid user cannot edit event' do
    user = users(:basic_user)
    event = events(:event_example)

    sign_in user
    put event_path(id: event.id), params: { event: { name: 'event_admin' } }

    assert_response :redirect
    refute_equal 'event_admin', event.reload.name
  end

  test 'no registered user can access only show and index' do
    event = events(:event_example)
    happy_path = [events_path, event_path(event)]

    happy_path.each do |path|
      get path
      assert_response :success
    end
  end

  test 'Valid user can delete event' do
    user = users(:admin_user)
    event = events(:event_example)

    sign_in user
    assert_difference 'Event.count', -1 do
      delete event_path(id: event.id)
    end

    assert_response :redirect
  end

  test 'Invalid user cannot delete event' do
    user = users(:basic_user)
    event = events(:event_example)

    sign_in user
    assert_no_difference 'Event.count' do
      delete event_path(id: event.id)
    end

    assert_response :redirect
  end
end
