package com.example.mrfarmergrocer2.databinding;
import com.example.mrfarmergrocer2.R;
import com.example.mrfarmergrocer2.BR;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.View;
@SuppressWarnings("unchecked")
public class ActivityShoppingCartBindingImpl extends ActivityShoppingCartBinding  {

    @Nullable
    private static final androidx.databinding.ViewDataBinding.IncludedLayouts sIncludes;
    @Nullable
    private static final android.util.SparseIntArray sViewsWithIds;
    static {
        sIncludes = null;
        sViewsWithIds = new android.util.SparseIntArray();
        sViewsWithIds.put(R.id.shoppingCartToolbar, 1);
        sViewsWithIds.put(R.id.mrFarmerLogo, 2);
        sViewsWithIds.put(R.id.shoppingCartDeleteButton, 3);
        sViewsWithIds.put(R.id.bottom_navigation, 4);
        sViewsWithIds.put(R.id.selectAddressButton, 5);
        sViewsWithIds.put(R.id.shoppingCartAddressTitle, 6);
        sViewsWithIds.put(R.id.shoppingCartReciName, 7);
        sViewsWithIds.put(R.id.shoppingCartPhoneNum, 8);
        sViewsWithIds.put(R.id.shoppingCartAddressDetails, 9);
        sViewsWithIds.put(R.id.shoppingCartRecycleView, 10);
        sViewsWithIds.put(R.id.shippingTitle, 11);
        sViewsWithIds.put(R.id.totalTitle, 12);
        sViewsWithIds.put(R.id.totalPrice, 13);
        sViewsWithIds.put(R.id.checkOutButton, 14);
        sViewsWithIds.put(R.id.noItemInCartText, 15);
        sViewsWithIds.put(R.id.goToShoppingButton, 16);
        sViewsWithIds.put(R.id.navView, 17);
    }
    // views
    // variables
    // values
    // listeners
    // Inverse Binding Event Handlers

    public ActivityShoppingCartBindingImpl(@Nullable androidx.databinding.DataBindingComponent bindingComponent, @NonNull View root) {
        this(bindingComponent, root, mapBindings(bindingComponent, root, 18, sIncludes, sViewsWithIds));
    }
    private ActivityShoppingCartBindingImpl(androidx.databinding.DataBindingComponent bindingComponent, View root, Object[] bindings) {
        super(bindingComponent, root, 0
            , (com.google.android.material.bottomnavigation.BottomNavigationView) bindings[4]
            , (android.widget.Button) bindings[14]
            , (androidx.drawerlayout.widget.DrawerLayout) bindings[0]
            , (android.widget.Button) bindings[16]
            , (android.widget.ImageView) bindings[2]
            , (com.google.android.material.navigation.NavigationView) bindings[17]
            , (android.widget.TextView) bindings[15]
            , (android.widget.Button) bindings[5]
            , (android.widget.TextView) bindings[11]
            , (android.widget.TextView) bindings[9]
            , (android.widget.TextView) bindings[6]
            , (android.widget.Button) bindings[3]
            , (android.widget.TextView) bindings[8]
            , (android.widget.TextView) bindings[7]
            , (androidx.recyclerview.widget.RecyclerView) bindings[10]
            , (androidx.appcompat.widget.Toolbar) bindings[1]
            , (android.widget.TextView) bindings[13]
            , (android.widget.TextView) bindings[12]
            );
        this.drawerLayout.setTag(null);
        setRootTag(root);
        // listeners
        invalidateAll();
    }

    @Override
    public void invalidateAll() {
        synchronized(this) {
                mDirtyFlags = 0x1L;
        }
        requestRebind();
    }

    @Override
    public boolean hasPendingBindings() {
        synchronized(this) {
            if (mDirtyFlags != 0) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean setVariable(int variableId, @Nullable Object variable)  {
        boolean variableSet = true;
            return variableSet;
    }

    @Override
    protected boolean onFieldChange(int localFieldId, Object object, int fieldId) {
        switch (localFieldId) {
        }
        return false;
    }

    @Override
    protected void executeBindings() {
        long dirtyFlags = 0;
        synchronized(this) {
            dirtyFlags = mDirtyFlags;
            mDirtyFlags = 0;
        }
        // batch finished
    }
    // Listener Stub Implementations
    // callback impls
    // dirty flag
    private  long mDirtyFlags = 0xffffffffffffffffL;
    /* flag mapping
        flag 0 (0x1L): null
    flag mapping end*/
    //end
}