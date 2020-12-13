package com.example.mrfarmergrocer2;

import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.View;
import androidx.databinding.DataBinderMapper;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.ViewDataBinding;
import com.example.mrfarmergrocer2.databinding.ActivityAccountSettingBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityAddNewAddressBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityAllOrdersBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityAllProductsBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityAllWishListProductsBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityChangePasswordBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityContactUsBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityCreateNewPasswordBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityEditAddressBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityForgotPasswordBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityHomeBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityLogInBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityMyAccountBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityOrderDetailsBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityPaymentBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityProductDetailsBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivitySearchProductBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivityShoppingCartBindingImpl;
import com.example.mrfarmergrocer2.databinding.ActivitySignUpBindingImpl;
import java.lang.IllegalArgumentException;
import java.lang.Integer;
import java.lang.Object;
import java.lang.Override;
import java.lang.RuntimeException;
import java.lang.String;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DataBinderMapperImpl extends DataBinderMapper {
  private static final int LAYOUT_ACTIVITYACCOUNTSETTING = 1;

  private static final int LAYOUT_ACTIVITYADDNEWADDRESS = 2;

  private static final int LAYOUT_ACTIVITYALLORDERS = 3;

  private static final int LAYOUT_ACTIVITYALLPRODUCTS = 4;

  private static final int LAYOUT_ACTIVITYALLWISHLISTPRODUCTS = 5;

  private static final int LAYOUT_ACTIVITYCHANGEPASSWORD = 6;

  private static final int LAYOUT_ACTIVITYCONTACTUS = 7;

  private static final int LAYOUT_ACTIVITYCREATENEWPASSWORD = 8;

  private static final int LAYOUT_ACTIVITYEDITADDRESS = 9;

  private static final int LAYOUT_ACTIVITYFORGOTPASSWORD = 10;

  private static final int LAYOUT_ACTIVITYHOME = 11;

  private static final int LAYOUT_ACTIVITYLOGIN = 12;

  private static final int LAYOUT_ACTIVITYMYACCOUNT = 13;

  private static final int LAYOUT_ACTIVITYORDERDETAILS = 14;

  private static final int LAYOUT_ACTIVITYPAYMENT = 15;

  private static final int LAYOUT_ACTIVITYPRODUCTDETAILS = 16;

  private static final int LAYOUT_ACTIVITYSEARCHPRODUCT = 17;

  private static final int LAYOUT_ACTIVITYSHOPPINGCART = 18;

  private static final int LAYOUT_ACTIVITYSIGNUP = 19;

  private static final SparseIntArray INTERNAL_LAYOUT_ID_LOOKUP = new SparseIntArray(19);

  static {
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_account_setting, LAYOUT_ACTIVITYACCOUNTSETTING);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_add_new_address, LAYOUT_ACTIVITYADDNEWADDRESS);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_all_orders, LAYOUT_ACTIVITYALLORDERS);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_all_products, LAYOUT_ACTIVITYALLPRODUCTS);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_all_wish_list_products, LAYOUT_ACTIVITYALLWISHLISTPRODUCTS);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_change_password, LAYOUT_ACTIVITYCHANGEPASSWORD);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_contact_us, LAYOUT_ACTIVITYCONTACTUS);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_create_new_password, LAYOUT_ACTIVITYCREATENEWPASSWORD);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_edit_address, LAYOUT_ACTIVITYEDITADDRESS);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_forgot_password, LAYOUT_ACTIVITYFORGOTPASSWORD);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_home, LAYOUT_ACTIVITYHOME);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_log_in, LAYOUT_ACTIVITYLOGIN);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_my_account, LAYOUT_ACTIVITYMYACCOUNT);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_order_details, LAYOUT_ACTIVITYORDERDETAILS);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_payment, LAYOUT_ACTIVITYPAYMENT);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_product_details, LAYOUT_ACTIVITYPRODUCTDETAILS);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_search_product, LAYOUT_ACTIVITYSEARCHPRODUCT);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_shopping_cart, LAYOUT_ACTIVITYSHOPPINGCART);
    INTERNAL_LAYOUT_ID_LOOKUP.put(com.example.mrfarmergrocer2.R.layout.activity_sign_up, LAYOUT_ACTIVITYSIGNUP);
  }

  @Override
  public ViewDataBinding getDataBinder(DataBindingComponent component, View view, int layoutId) {
    int localizedLayoutId = INTERNAL_LAYOUT_ID_LOOKUP.get(layoutId);
    if(localizedLayoutId > 0) {
      final Object tag = view.getTag();
      if(tag == null) {
        throw new RuntimeException("view must have a tag");
      }
      switch(localizedLayoutId) {
        case  LAYOUT_ACTIVITYACCOUNTSETTING: {
          if ("layout/activity_account_setting_0".equals(tag)) {
            return new ActivityAccountSettingBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_account_setting is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYADDNEWADDRESS: {
          if ("layout/activity_add_new_address_0".equals(tag)) {
            return new ActivityAddNewAddressBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_add_new_address is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYALLORDERS: {
          if ("layout/activity_all_orders_0".equals(tag)) {
            return new ActivityAllOrdersBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_all_orders is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYALLPRODUCTS: {
          if ("layout/activity_all_products_0".equals(tag)) {
            return new ActivityAllProductsBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_all_products is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYALLWISHLISTPRODUCTS: {
          if ("layout/activity_all_wish_list_products_0".equals(tag)) {
            return new ActivityAllWishListProductsBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_all_wish_list_products is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYCHANGEPASSWORD: {
          if ("layout/activity_change_password_0".equals(tag)) {
            return new ActivityChangePasswordBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_change_password is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYCONTACTUS: {
          if ("layout/activity_contact_us_0".equals(tag)) {
            return new ActivityContactUsBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_contact_us is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYCREATENEWPASSWORD: {
          if ("layout/activity_create_new_password_0".equals(tag)) {
            return new ActivityCreateNewPasswordBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_create_new_password is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYEDITADDRESS: {
          if ("layout/activity_edit_address_0".equals(tag)) {
            return new ActivityEditAddressBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_edit_address is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYFORGOTPASSWORD: {
          if ("layout/activity_forgot_password_0".equals(tag)) {
            return new ActivityForgotPasswordBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_forgot_password is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYHOME: {
          if ("layout/activity_home_0".equals(tag)) {
            return new ActivityHomeBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_home is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYLOGIN: {
          if ("layout/activity_log_in_0".equals(tag)) {
            return new ActivityLogInBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_log_in is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYMYACCOUNT: {
          if ("layout/activity_my_account_0".equals(tag)) {
            return new ActivityMyAccountBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_my_account is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYORDERDETAILS: {
          if ("layout/activity_order_details_0".equals(tag)) {
            return new ActivityOrderDetailsBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_order_details is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYPAYMENT: {
          if ("layout/activity_payment_0".equals(tag)) {
            return new ActivityPaymentBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_payment is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYPRODUCTDETAILS: {
          if ("layout/activity_product_details_0".equals(tag)) {
            return new ActivityProductDetailsBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_product_details is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYSEARCHPRODUCT: {
          if ("layout/activity_search_product_0".equals(tag)) {
            return new ActivitySearchProductBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_search_product is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYSHOPPINGCART: {
          if ("layout/activity_shopping_cart_0".equals(tag)) {
            return new ActivityShoppingCartBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_shopping_cart is invalid. Received: " + tag);
        }
        case  LAYOUT_ACTIVITYSIGNUP: {
          if ("layout/activity_sign_up_0".equals(tag)) {
            return new ActivitySignUpBindingImpl(component, view);
          }
          throw new IllegalArgumentException("The tag for activity_sign_up is invalid. Received: " + tag);
        }
      }
    }
    return null;
  }

  @Override
  public ViewDataBinding getDataBinder(DataBindingComponent component, View[] views, int layoutId) {
    if(views == null || views.length == 0) {
      return null;
    }
    int localizedLayoutId = INTERNAL_LAYOUT_ID_LOOKUP.get(layoutId);
    if(localizedLayoutId > 0) {
      final Object tag = views[0].getTag();
      if(tag == null) {
        throw new RuntimeException("view must have a tag");
      }
      switch(localizedLayoutId) {
      }
    }
    return null;
  }

  @Override
  public int getLayoutId(String tag) {
    if (tag == null) {
      return 0;
    }
    Integer tmpVal = InnerLayoutIdLookup.sKeys.get(tag);
    return tmpVal == null ? 0 : tmpVal;
  }

  @Override
  public String convertBrIdToString(int localId) {
    String tmpVal = InnerBrLookup.sKeys.get(localId);
    return tmpVal;
  }

  @Override
  public List<DataBinderMapper> collectDependencies() {
    ArrayList<DataBinderMapper> result = new ArrayList<DataBinderMapper>(1);
    result.add(new androidx.databinding.library.baseAdapters.DataBinderMapperImpl());
    return result;
  }

  private static class InnerBrLookup {
    static final SparseArray<String> sKeys = new SparseArray<String>(1);

    static {
      sKeys.put(0, "_all");
    }
  }

  private static class InnerLayoutIdLookup {
    static final HashMap<String, Integer> sKeys = new HashMap<String, Integer>(19);

    static {
      sKeys.put("layout/activity_account_setting_0", com.example.mrfarmergrocer2.R.layout.activity_account_setting);
      sKeys.put("layout/activity_add_new_address_0", com.example.mrfarmergrocer2.R.layout.activity_add_new_address);
      sKeys.put("layout/activity_all_orders_0", com.example.mrfarmergrocer2.R.layout.activity_all_orders);
      sKeys.put("layout/activity_all_products_0", com.example.mrfarmergrocer2.R.layout.activity_all_products);
      sKeys.put("layout/activity_all_wish_list_products_0", com.example.mrfarmergrocer2.R.layout.activity_all_wish_list_products);
      sKeys.put("layout/activity_change_password_0", com.example.mrfarmergrocer2.R.layout.activity_change_password);
      sKeys.put("layout/activity_contact_us_0", com.example.mrfarmergrocer2.R.layout.activity_contact_us);
      sKeys.put("layout/activity_create_new_password_0", com.example.mrfarmergrocer2.R.layout.activity_create_new_password);
      sKeys.put("layout/activity_edit_address_0", com.example.mrfarmergrocer2.R.layout.activity_edit_address);
      sKeys.put("layout/activity_forgot_password_0", com.example.mrfarmergrocer2.R.layout.activity_forgot_password);
      sKeys.put("layout/activity_home_0", com.example.mrfarmergrocer2.R.layout.activity_home);
      sKeys.put("layout/activity_log_in_0", com.example.mrfarmergrocer2.R.layout.activity_log_in);
      sKeys.put("layout/activity_my_account_0", com.example.mrfarmergrocer2.R.layout.activity_my_account);
      sKeys.put("layout/activity_order_details_0", com.example.mrfarmergrocer2.R.layout.activity_order_details);
      sKeys.put("layout/activity_payment_0", com.example.mrfarmergrocer2.R.layout.activity_payment);
      sKeys.put("layout/activity_product_details_0", com.example.mrfarmergrocer2.R.layout.activity_product_details);
      sKeys.put("layout/activity_search_product_0", com.example.mrfarmergrocer2.R.layout.activity_search_product);
      sKeys.put("layout/activity_shopping_cart_0", com.example.mrfarmergrocer2.R.layout.activity_shopping_cart);
      sKeys.put("layout/activity_sign_up_0", com.example.mrfarmergrocer2.R.layout.activity_sign_up);
    }
  }
}
