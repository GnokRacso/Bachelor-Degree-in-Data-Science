package com.example.mrfarmergrocer2.databinding;
import com.example.mrfarmergrocer2.R;
import com.example.mrfarmergrocer2.BR;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.View;
@SuppressWarnings("unchecked")
public class ActivitySignUpBindingImpl extends ActivitySignUpBinding  {

    @Nullable
    private static final androidx.databinding.ViewDataBinding.IncludedLayouts sIncludes;
    @Nullable
    private static final android.util.SparseIntArray sViewsWithIds;
    static {
        sIncludes = null;
        sViewsWithIds = new android.util.SparseIntArray();
        sViewsWithIds.put(R.id.mrFarmerLogo, 1);
        sViewsWithIds.put(R.id.sign_up_title, 2);
        sViewsWithIds.put(R.id.fullName_input, 3);
        sViewsWithIds.put(R.id.userName_input, 4);
        sViewsWithIds.put(R.id.email_input, 5);
        sViewsWithIds.put(R.id.password_input, 6);
        sViewsWithIds.put(R.id.confirm_password_input, 7);
        sViewsWithIds.put(R.id.security_question_spinner, 8);
        sViewsWithIds.put(R.id.security_question_answer, 9);
        sViewsWithIds.put(R.id.sign_up_button, 10);
        sViewsWithIds.put(R.id.confirm_sign_up_text, 11);
        sViewsWithIds.put(R.id.alreadyHaveAccount, 12);
        sViewsWithIds.put(R.id.progressBar, 13);
    }
    // views
    @NonNull
    private final android.widget.ScrollView mboundView0;
    // variables
    // values
    // listeners
    // Inverse Binding Event Handlers

    public ActivitySignUpBindingImpl(@Nullable androidx.databinding.DataBindingComponent bindingComponent, @NonNull View root) {
        this(bindingComponent, root, mapBindings(bindingComponent, root, 14, sIncludes, sViewsWithIds));
    }
    private ActivitySignUpBindingImpl(androidx.databinding.DataBindingComponent bindingComponent, View root, Object[] bindings) {
        super(bindingComponent, root, 0
            , (android.widget.Button) bindings[12]
            , (com.google.android.material.textfield.TextInputLayout) bindings[7]
            , (android.widget.TextView) bindings[11]
            , (com.google.android.material.textfield.TextInputLayout) bindings[5]
            , (com.google.android.material.textfield.TextInputLayout) bindings[3]
            , (android.widget.ImageView) bindings[1]
            , (com.google.android.material.textfield.TextInputLayout) bindings[6]
            , (android.widget.ProgressBar) bindings[13]
            , (com.google.android.material.textfield.TextInputLayout) bindings[9]
            , (android.widget.Spinner) bindings[8]
            , (android.widget.Button) bindings[10]
            , (android.widget.TextView) bindings[2]
            , (com.google.android.material.textfield.TextInputLayout) bindings[4]
            );
        this.mboundView0 = (android.widget.ScrollView) bindings[0];
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