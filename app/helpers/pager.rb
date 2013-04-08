class Pager 
  
  attr_accessor :elements_per_page
  
  def get_page(elements, page)
    if page.nil?
      return elements
    end
    
    from = (page.to_i - 1) * @elements_per_page
    to = ((page.to_i - 1) * @elements_per_page + @elements_per_page ) - 1
    elements[from..to]
  end
  
  def number_of_pages elements
   elements_per_page = (elements.size % @elements_per_page).to_i
   
   if elements_per_page < 1
     return 1
   end
   
   return elements_per_page
  end
  
end