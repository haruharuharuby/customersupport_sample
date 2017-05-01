module ApplicationHelper

  current_csp = ActiveDecorator::Decorator.instance.decorate(current_csp) if current_csp

  def contents_navigation
    [
      { path:"#", icon:"user", display:(t 'navigation.mymenu'),
        children:[
          { path:announcements_path, display:(t 'navigation.announcement') },
          { path:csp_path(current_csp), display:(t 'navigation.csp') },
          { path:nursery_path(current_csp.nursery), display:(t 'navigation.nursery') },
          { path:billing_path(current_csp.billings[0]), display:(t 'navigation.billing') },
          { path:new_contact_path, display:(t 'navigation.contact') },
          { path:"#", display:(t 'navigation.questions') },
        ]
      },
      { path:"#", icon:"cutlery", display:(t 'navigation.menu'),
        children:[
          { path:"http://admcom.co.jp/kichene/monthly_menu.php", display:(t 'navigation.monthly') },
          { path:"http://admcom.co.jp/product/wanpaku/sample.php", display:(t 'navigation.sample') }
        ]
      },
      { path:"#", icon:"level-up", display:(t 'navigation.skill_up'),
        children:[
          { path:"https://admcom.co.jp/faq_blog/", display:(t 'navigation.manual') },
          { path:"https://admcom.co.jp/recipe/", display:(t 'navigation.recipe') },
          { path:"https://admcom.co.jp/member/wankatsu_mov.php", display:(t 'navigation.dedicated') },
          { path:"https://admcom.co.jp/wanpakuweb/ai/index.php", display:(t 'navigation.dietary_education') }
        ]
      },
      { path:"#", icon:"folder", display:(t 'navigation.data_management'),
        children:[
          { path:"https://admcom.co.jp/uploader/", display:(t 'navigation.backup') }
        ]
      },
      { path:"#", icon:"paper-plane-o", display:(t 'navigation.shipping_management'),
        children:[
          { path:sending_objects_path, display:(t 'navigation.history') }
        ]
      },
      { path:"#", icon:"download", display:(t 'navigation.download'),
        children:[
          { path:"https://admcom.co.jp/downloader/?k=1", display:(t 'navigation.letter') },
          { path:"https://admcom.co.jp/downloader/index.php?k=3", display:(t 'navigation.latest') },
          { path:"https://admcom.co.jp/downloader/?k=4", display:(t 'navigation.other') }
        ]
      }
    ]
  end

  def devise_authenticate_key(resource)
    if resource.class == User
      :name
    elsif resource.class == Csp
      :number
    else
      nil
    end
  end
end
