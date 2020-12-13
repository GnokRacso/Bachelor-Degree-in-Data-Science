package com.example.mrfarmergrocer2.databinding;
import com.example.mrfarmergrocer2.R;
import com.example.mrfarmergrocer2.BR;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.View;
@SuppressWarnings("unchecked")
public class ActivityMyAccountBindingImpl extends ActivityMyAccountBinding  {

    @Nullable
    private static final androidx.databinding.ViewDataBinding.IncludedLayouts sIncludes;
    @Nullable
    private static final android.util.SparseIntArray sViewsWithIds;
    static {
        sIncludes = null;
        sViewsWithIds = new android.util.SparseIntArray();
        sViewsWithIds.put(R.id.main_content, 1);
        sViewsWithIds.put(R.id.myAccountToolbar, 2);
        sViewsWithIds.put(R.id.log_in_title, 3);
        sViewsWithIds.put(R.id.bottom_navigation, 4);
        sViewsWithIds.put(R.id.progressBar, 5);
        sViewsWithIds.put(R.id.profilePicture, 6);
        sViewsWithIds.put(R.id.userFullName, 7);
        sViewsWithIds.put(R.id.allOrdersButton, 8);
        sViewsWithIds.put(R.id.wishListButton, 9);
        sViewsWithIds.put(R.id.myAddressesButton, 10);
        sViewsWithIds.put(R.id.accountSettingsButton, 11);
        sViewsWithIds.put(R.id.logOutButton, 12);
        sViewsWithIds.put(R.id.navView, 13);
    }
    // views
    // variables
    // values
    // listeners
    // Inverse Binding Event Handlers

    public ActivityMyAccountBindingImpl(@Nullable androidx.databinding.DataBindingComponent bindingComponent, @NonNull View root) {
        this(bindingComponent, root, mapBindings(bindingComponent, root, 14, sIncludes, sViewsWithIds));
    }
    private ActivityMyAccountBindingImpl(androidx.databinding.DataBindingComponent bindingComponent, View root, Object[] bindings) {
        super(bindingComponent, root, 0
            , (android.widget.Button) bindings[11]
            , (android.widget.Button) bindings[8]
            , (com.google.android.material.bottomnavigation.BottomNavigationView) bindings[4]
            , (androidx.drawerlayout.widget.DrawerLayout) bindings[0]
            , (android.widget.TextView) bindings[3]
            , (android.widget.Button) bindings[12]
            , (androidx.constraintlayout.widget.ConstraintLayout) bindings[1]
            , (androidx.appcompat.widget.Toolbar) bindings[2]
            , (android.widget.Button) bindings[10]
            , (com.google.android.material.navigation.NavigationView) bindings[13]
            , (de.hdodenhof.circleimageview.CircleImageView) bindings[6]
            , (android.widget.ProgressBar) bindings[5]
            , (android.widget.TextView) bindings[7]
            , (android.widget.Button) bindings[9]
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