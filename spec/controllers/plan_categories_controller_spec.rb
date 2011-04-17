require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe PlanCategoriesController do

  def mock_plan_category(stubs={})
    @mock_plan_category ||= mock_model(PlanCategory, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all plan_categories as @plan_categories" do
      PlanCategory.stub(:all) { [mock_plan_category] }
      get :index
      assigns(:plan_categories).should eq([mock_plan_category])
    end
  end

  describe "GET show" do
    it "assigns the requested plan_category as @plan_category" do
      PlanCategory.stub(:find).with("37") { mock_plan_category }
      get :show, :id => "37"
      assigns(:plan_category).should be(mock_plan_category)
    end
  end

  describe "GET new" do
    it "assigns a new plan_category as @plan_category" do
      PlanCategory.stub(:new) { mock_plan_category }
      get :new
      assigns(:plan_category).should be(mock_plan_category)
    end
  end

  describe "GET edit" do
    it "assigns the requested plan_category as @plan_category" do
      PlanCategory.stub(:find).with("37") { mock_plan_category }
      get :edit, :id => "37"
      assigns(:plan_category).should be(mock_plan_category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created plan_category as @plan_category" do
        PlanCategory.stub(:new).with({'these' => 'params'}) { mock_plan_category(:save => true) }
        post :create, :plan_category => {'these' => 'params'}
        assigns(:plan_category).should be(mock_plan_category)
      end

      it "redirects to the created plan_category" do
        PlanCategory.stub(:new) { mock_plan_category(:save => true) }
        post :create, :plan_category => {}
        response.should redirect_to(plan_category_url(mock_plan_category))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved plan_category as @plan_category" do
        PlanCategory.stub(:new).with({'these' => 'params'}) { mock_plan_category(:save => false) }
        post :create, :plan_category => {'these' => 'params'}
        assigns(:plan_category).should be(mock_plan_category)
      end

      it "re-renders the 'new' template" do
        PlanCategory.stub(:new) { mock_plan_category(:save => false) }
        post :create, :plan_category => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested plan_category" do
        PlanCategory.stub(:find).with("37") { mock_plan_category }
        mock_plan_category.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :plan_category => {'these' => 'params'}
      end

      it "assigns the requested plan_category as @plan_category" do
        PlanCategory.stub(:find) { mock_plan_category(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:plan_category).should be(mock_plan_category)
      end

      it "redirects to the plan_category" do
        PlanCategory.stub(:find) { mock_plan_category(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(plan_category_url(mock_plan_category))
      end
    end

    describe "with invalid params" do
      it "assigns the plan_category as @plan_category" do
        PlanCategory.stub(:find) { mock_plan_category(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:plan_category).should be(mock_plan_category)
      end

      it "re-renders the 'edit' template" do
        PlanCategory.stub(:find) { mock_plan_category(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested plan_category" do
      PlanCategory.stub(:find).with("37") { mock_plan_category }
      mock_plan_category.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the plan_categories list" do
      PlanCategory.stub(:find) { mock_plan_category }
      delete :destroy, :id => "1"
      response.should redirect_to(plan_categories_url)
    end
  end

end
