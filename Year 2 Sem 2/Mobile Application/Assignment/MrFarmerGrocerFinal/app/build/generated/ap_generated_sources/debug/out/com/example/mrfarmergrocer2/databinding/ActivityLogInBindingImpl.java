package com.example.mrfarmergrocer2.databinding;
import com.example.mrfarmergrocer2.R;
import com.example.mrfarmergrocer2.BR;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.View;
@SuppressWarnings("unchecked")
public class ActivityLogInBindingImpl extends ActivityLogInBinding  {

    @Nullable
    private static final androidx.databinding.ViewDataBinding.IncludedLayouts sIncludes;
    @Nullable
    private static final android.util.SparseIntArray sViewsWithIds;
    static {
        sIncludes = null;
        sViewsWithIds = new android.util.SparseIntArray();
        sViewsWithIds.put(R.id.log_in_word, 1);
        sViewsWithIds.put(R.id.userName_input, 2);
        sViewsWithIds.put(R.id.password_input, 3);
        sViewsWithIds.put(R.id.forgotPasswordButton, 4);
        sViewsWithIds.put(R.id.checkboxRememberMe, 5);
        sViewsWithIds.put(R.id.sign_up_button, 6);
        sViewsWithIds.put(R.id.log_in_button, 7);
        sViewsWithIds.put(R.id.anAdminButton, 8);
        sViewsWithIds.put(R.id.notAnAdminButton, 9);
        sViewsWithIds.put(R.id.progressBar, 10);
    }
    // views
    @NonNull
    private final androidx.constraintlayout.widget.ConstraintLayout mboundView0;
    // variables
    // values
    // listeners
    // Inverse Binding Event Handlers

    public ActivityLogInBindingImpl(@Nullable androidx.databinding.DataBindingComponent bindingComponent, @NonNull View root) {
        this(bindingComponent, root, mapBindings(bindingComponent, root, 11, sIncludes, sViewsWithIds));
    }
    private ActivityLogInBindingImpl(androidx.databinding.DataBindingComponent bindingComponent, View root, Object[] bindings) {
        super(bindingComponent, root, 0
            , (android.widget.Button) bindings[8]
            , (android.widget.CheckBox) bindings[5]
            , (android.widget.Button) bindings[4]
            , (android.widget.Button) bindings[7]
            , (android.widget.TextView) bindings[1]
            , (android.widget.Button) bindings[9]
            , (com.google.android.material.textfield.TextInputLayout) bindings[3]
            , (android.widget.ProgressBar) bindings[10]
            , (android.widget.Button) bindings[6]
            , (com.google.android.material.textfield.TextInputLayout) bindings[2]
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