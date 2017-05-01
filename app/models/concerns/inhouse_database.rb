module InhouseDatabase
  extend ActiveSupport::Concern

  def put_catalog
    json_data = self.as_json(
      include: {
        nursery: { include: :organization },
      }
    )

    put_s3('catalog', json_data)
  end

  def put_estimation
    json_data = self.as_json(
      include: {
        nursery: { include: :organization },
        estimation_details: { include: :product }
      }
    )

    put_s3('estimation', json_data)
  end

  def put_order()
    self.org_nursery_name.gsub!(/[[:blank:]]/,'')
    json_data = self.as_json(
      include: { order_details: { include: :product } },
    )
    json_data['questionnaire'] = self.questionnaire.as_json
    put_s3('order', json_data)
  end

  def put_s3(key, data)
    date = DateTime.now.strftime("%y-%m-%d")

    s3 = Aws::S3::Client.new
    bucket = s3.put_object({
      bucket: 'admcustomerserviceorder',
      key: "#{key}_#{self.id}_#{date}",
      body: JSON.pretty_generate(data)
    })
  end
end
