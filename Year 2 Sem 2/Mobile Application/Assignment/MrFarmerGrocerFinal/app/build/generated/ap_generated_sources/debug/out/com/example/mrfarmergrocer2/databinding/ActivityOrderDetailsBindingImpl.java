package com.example.mrfarmergrocer2.databinding;
import com.example.mrfarmergrocer2.R;
import com.example.mrfarmergrocer2.BR;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.View;
@SuppressWarnings("unchecked")
public class ActivityOrderDetailsBindingImpl extends ActivityOrderDetailsBinding  {

    @Nullable
    private static final androidx.databinding.ViewDataBinding.IncludedLayouts sIncludes;
    @Nullable
    private static final android.util.SparseIntArray sViewsWithIds;
    static {
        sIncludes = null;
        sViewsWithIds = new android.util.SparseIntArray();
        sViewsWithIds.put(R.id.orderDetailsToolBar, 1);
        sViewsWithIds.put(R.id.productDetailsTitle, 2);
        sViewsWithIds.put(R.id.orderProdOrderID, 3);
        sViewsWithIds.put(R.id.orderProdAddressTitle, 4);
        sViewsWithIds.put(R.id.orderProdAddressView, 5);
        sViewsWithIds.put(R.id.orderProdReciName, 6);
        sViewsWithIds.put(R.id.orderProdPhoneNum, 7);
        sViewsWithIds.put(R.id.orderProdAddressDetails, 8);
        sViewsWithIds.put(R.id.orderSummaryView, 9);
        sViewsWithIds.put(R.id.orderProdTotalSummaryTitle, 10);
        sViewsWithIds.put(R.id.orderProdSubtotalTitle, 11);
        sViewsWithIds.put(R.id.orderProdSubtotalPrice, 12);
        sViewsWithIds.put(R.id.orderProdShippingTitle, 13);
        sViewsWithIds.put(R.id.orderProdTolTitle, 14);
        sViewsWithIds.put(R.id.orderProdTotalPrice, 15);
        sViewsWithIds.put(R.id.orderProdsRecycleView, 16);
    }
    // views
    @NonNull
    private final android.widget.RelativeLayout mboundView0;
    // variables
    // values
    // listeners
    // Inverse Binding Event Handlers

    public ActivityOrderDetailsBindingImpl(@Nullable androidx.databinding.DataBindingComponent bindingComponent, @NonNull View root) {
        this(bindingComponent, root, mapBindings(bindingComponent, root, 17, sIncludes, sViewsWithIds));
    }
    private ActivityOrderDetailsBindingImpl(androidx.databinding.DataBindingComponent bindingComponent, View root, Object[] bindings) {
        super(bindingComponent, root, 0
            , (androidx.appcompat.widget.Toolbar) bindings[1]
            , (android.widget.TextView) bindings[8]
            , (android.widget.TextView) bindings[4]
            , (android.widget.LinearLayout) bindings[5]
            , (android.widget.TextView) bindings[3]
            , (android.widget.TextView) bindings[7]
            , (android.widget.TextView) bindings[6]
            , (android.widget.TextView) bindings[13]
            , (android.widget.TextView) bindings[12]
            , (android.widget.TextView) bindings[11]
            , (android.widget.TextView) bindings[14]
            , (android.widget.TextView) bindings[15]
            , (android.widget.TextView) bindings[10]
            , (androidx.recyclerview.widget.RecyclerView) bindings[16]
            , (android.widget.RelativeLayout) bindings[9]
            , (android.widget.ImageView) bindings[2]
            );
        this.mboundView0 = (android.widget.RelativeLayout) bindings[0];
        this.mboundView0.setTag(null);
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