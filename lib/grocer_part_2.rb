require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  counter = 0 
  while counter < coupons.length 
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    coupon_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[counter][:num] 
        cart_item[:count] -= coupons[counter][:num]
      else
        cart_item_with_coupon = {
          item: coupon_item_name,
          price: (coupons[counter][:cost] / coupons[counter][:num]),
          count: coupons[counter][:num],
          clearance: cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end 
   end 
   counter += 1 
  end 
  cart
end 

def clearance_calc(n)
  percent = n.to_f * 0.2 
  n -= percent
end

def apply_clearance(cart)
  counter = 0 
  while counter < cart.length 
  if cart[counter][:clearance]
   cart[counter][:price]  = clearance_calc(cart[counter][:price])
    end 
    counter += 1 
  end 
  cart 
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart)
  total = 0 
  count = 0 
  while count < final_cart.length
  total = final_cart[count][:price] * final_cart[count][:count]
  counter += 1 
end 
if total > 100
  total -= total.to_f * 0.1 
end
total 
end 