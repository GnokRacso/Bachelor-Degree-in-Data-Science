package com.example.mrfarmergrocer2.databinding;
import com.example.mrfarmergrocer2.R;
import com.example.mrfarmergrocer2.BR;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.View;
@SuppressWarnings("unchecked")
public class ActivityPaymentBindingImpl extends ActivityPaymentBinding  {

    @Nullable
    private static final androidx.databinding.ViewDataBinding.IncludedLayouts sIncludes;
    @Nullable
    private static final android.util.SparseIntArray sViewsWithIds;
    static {
        sIncludes = null;
        sViewsWithIds = new android.util.SparseIntArray();
        sViewsWithIds.put(R.id.paymentToolbar, 1);
        sViewsWithIds.put(R.id.productDetailsTitle, 2);
        sViewsWithIds.put(R.id.selectPaymentMethod, 3);
        sViewsWithIds.put(R.id.orderSummary, 4);
        sViewsWithIds.put(R.id.orderSummaryTitle, 5);
        sViewsWithIds.put(R.id.subTotalTitle, 6);
        sViewsWithIds.put(R.id.subTotalPrice, 7);
        sViewsWithIds.put(R.id.shippingTitle, 8);
        sViewsWithIds.put(R.id.totalTitle, 9);
        sViewsWithIds.put(R.id.totalPrice, 10);
        sViewsWithIds.put(R.id.paymentSummary, 11);
        sViewsWithIds.put(R.id.visaIcon, 12);
        sViewsWithIds.put(R.id.masterCardIcon, 13);
        sViewsWithIds.put(R.id.cardPaymentTitle, 14);
        sViewsWithIds.put(R.id.cardNumberInput, 15);
        sViewsWithIds.put(R.id.cardMonthInput, 16);
        sViewsWithIds.put(R.id.cardYearInput, 17);
        sViewsWithIds.put(R.id.cardCVVInput, 18);
        sViewsWithIds.put(R.id.cardOTPReceive, 19);
        sViewsWithIds.put(R.id.paymentButton, 20);
        sViewsWithIds.put(R.id.paymentAfterOTPButton, 21);
        sViewsWithIds.put(R.id.cancelButton, 22);
        sViewsWithIds.put(R.id.cardTermsAndCondition, 23);
    }
    // views
    @NonNull
    private final androidx.constraintlayout.widget.ConstraintLayout mboundView0;
    // variables
    // values
    // listeners
    // Inverse Binding Event Handlers

    public ActivityPaymentBindingImpl(@Nullable androidx.databinding.DataBindingComponent bindingComponent, @NonNull View root) {
        this(bindingComponent, root, mapBindings(bindingComponent, root, 24, sIncludes, sViewsWithIds));
    }
    private ActivityPaymentBindingImpl(androidx.databinding.DataBindingComponent bindingComponent, View root, Object[] bindings) {
        super(bindingComponent, root, 0
            , (android.widget.Button) bindings[22]
            , (com.google.android.material.textfield.TextInputLayout) bindings[18]
            , (com.google.android.material.textfield.TextInputLayout) bindings[16]
            , (com.google.android.material.textfield.TextInputLayout) bindings[15]
            , (com.google.android.material.textfield.TextInputLayout) bindings[19]
            , (android.widget.TextView) bindings[14]
            , (android.widget.TextView) bindings[23]
            , (com.google.android.material.textfield.TextInputLayout) bindings[17]
            , (android.widget.ImageView) bindings[13]
            , (android.widget.RelativeLayout) bindings[4]
            , (android.widget.TextView) bindings[5]
            , (android.widget.Button) bindings[21]
            , (android.widget.Button) bindings[20]
            , (android.widget.RelativeLayout) bindings[11]
            , (androidx.appcompat.widget.Toolbar) bindings[1]
            , (android.widget.ImageView) bindings[2]
            , (android.widget.TextView) bindings[3]
            , (android.widget.TextView) bindings[8]
            , (android.widget.TextView) bindings[7]
            , (android.widget.TextView) bindings[6]
            , (android.widget.TextView) bindings[10]
            , (android.widget.TextView) bindings[9]
            , (android.widget.ImageView) bindings[12]
            );
        this.mboundView0 = (androidx.constraintlayout.widget.ConstraintLayout) bindings[0];
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