package com.example.mrfarmergrocer2.databinding;
import com.example.mrfarmergrocer2.R;
import com.example.mrfarmergrocer2.BR;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.View;
@SuppressWarnings("unchecked")
public class ActivityAllProductsBindingImpl extends ActivityAllProductsBinding  {

    @Nullable
    private static final androidx.databinding.ViewDataBinding.IncludedLayouts sIncludes;
    @Nullable
    private static final android.util.SparseIntArray sViewsWithIds;
    static {
        sIncludes = null;
        sViewsWithIds = new android.util.SparseIntArray();
        sViewsWithIds.put(R.id.productsToolBar, 1);
        sViewsWithIds.put(R.id.productDetailsTitle, 2);
        sViewsWithIds.put(R.id.search_button, 3);
        sViewsWithIds.put(R.id.category_type_spinner_all_prod, 4);
        sViewsWithIds.put(R.id.bottom_navigation, 5);
        sViewsWithIds.put(R.id.categoryType, 6);
        sViewsWithIds.put(R.id.productRecycleView, 7);
        sViewsWithIds.put(R.id.navView, 8);
    }
    // views
    // variables
    // values
    // listeners
    // Inverse Binding Event Handlers

    public ActivityAllProductsBindingImpl(@Nullable androidx.databinding.DataBindingComponent bindingComponent, @NonNull View root) {
        this(bindingComponent, root, mapBindings(bindingComponent, root, 9, sIncludes, sViewsWithIds));
    }
    private ActivityAllProductsBindingImpl(androidx.databinding.DataBindingComponent bindingComponent, View root, Object[] bindings) {
        super(bindingComponent, root, 0
            , (com.google.android.material.bottomnavigation.BottomNavigationView) bindings[5]
            , (android.widget.TextView) bindings[6]
            , (android.widget.Spinner) bindings[4]
            , (androidx.drawerlayout.widget.DrawerLayout) bindings[0]
            , (com.google.android.material.navigation.NavigationView) bindings[8]
            , (android.widget.ImageView) bindings[2]
            , (androidx.recyclerview.widget.RecyclerView) bindings[7]
            , (androidx.appcompat.widget.Toolbar) bindings[1]
            , (android.widget.ImageButton) bindings[3]
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