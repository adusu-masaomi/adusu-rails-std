class IdSetConstructionAttachments < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('construction_attachments_id_seq', 39)"
  end
end
