#
# Methods to use in views.
#
module ApplicationHelper
  def active_tab_class(*paths, isScopedClientsTab)
   active = false
   paths.each { |path| active ||= current_page?(path) }
   if(!isScopedClientsTab)
     active && params['scope'].nil? ? 'active' : ''
   else
     params['scope'].nil? ? '' : 'active'
   end
 end
end
