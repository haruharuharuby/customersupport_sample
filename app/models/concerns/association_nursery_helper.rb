module AssociationNurseryHelper

  def build_for_create_or_update(att)

    sym = att.to_sym

    if self.send(sym)
      temp_nursery = Nursery.find_by(postal_code: self.send(sym).postal_code, phone: self.send(sym).phone)
      temp_nursery_organization = Organization.find_by(name: self.send(sym).organization.name)
      if temp_nursery
        if temp_nursery_organization
          temp_nursery_organization.name = self.send(sym).organization.name
          temp_nursery_organization.kana = self.send(sym).organization.kana
          temp_nursery.organization = temp_nursery_organization
        else
          new_nursery_organization = Organization.create(name: self.send(sym).organization.name, kana: self.send(sym).organization.kana)
          temp_nursery.organization = new_nursery_organization
          temp_nursery.organization_id = new_nursery_organization.id
        end
        temp_nursery.name = self.send(sym).name
        temp_nursery.kana = self.send(sym).kana
        temp_nursery.postal_code = self.send(sym).postal_code
        temp_nursery.address1 = self.send(sym).address1
        temp_nursery.address2 = self.send(sym).address2
        temp_nursery.phone = self.send(sym).phone
        temp_nursery.fax = self.send(sym).fax
        temp_nursery.email = self.send(sym).email
        temp_nursery.responder = self.send(sym).responder
        temp_nursery.status = self.send(sym).status
        self.send("#{att}=".to_sym,temp_nursery)
        logger.debug(self.send(sym).inspect)
        logger.debug(self.send(sym).organization.inspect)
      else
        temp_nursery_organization = Organization.find_by(name: self.send(sym).organization.name)
        if temp_nursery_organization
          temp_nursery_organization.name = self.send(sym).organization.name
          temp_nursery_organization.kana = self.send(sym).organization.kana
          self.send(sym).organization = temp_nursery_organization
        else
          new_nursery_organization = Organization.create(name: self.send(sym).organization.name, kana: self.send(sym).organization.kana)
          self.send(sym).organization = new_nursery_organization
          self.send(sym).organization_id = new_nursery_organization.id
        end
        self.send(sym).csp_id = nil
        self.send(sym).dm_number = ''
      end
    end
  end

end
