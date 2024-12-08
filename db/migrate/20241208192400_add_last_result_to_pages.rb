class AddLastResultToPages < ActiveRecord::Migration[7.2]
  def change
    add_column :pages, :last_result_id, :integer

    Page.find_each do |page|
      last_result = page.results.order(created_at: :desc).first
      page.update(last_result_id: last_result.id) if last_result
    end
  end
end
