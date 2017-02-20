describe Admin::CampaignsController do
  context "create" do
    it "creates a campaign" do
      campaign_params = {
        campaign: {
          category: "earthquake"
        }
      }

      expect{
        post :create, params: campaign_params
      }.to change{ Campaign.count }.by(1)
    end
  end

  context "destroy" do
    let(:campaign) { create(:campaign, archived: false) }

    it "archives a campaign" do
      campaign_params = { id: campaign.id}

      delete :destroy, params: campaign_params

      archived_campaign = Campaign.find(campaign.id)

      expect(archived_campaign.archived).to be true
    end
  end
end