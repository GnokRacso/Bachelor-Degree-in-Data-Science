package com.example.mrfarmergrocer2

import android.app.Dialog
import android.content.DialogInterface
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ProgressBar
import androidx.appcompat.app.AlertDialog
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.DialogFragment
import androidx.fragment.app.FragmentManager
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase
import org.w3c.dom.Text
import java.util.regex.Pattern

class ChangePasswordDialogFragment : DialogFragment() {
    private lateinit var databaseRef: DatabaseReference
    private lateinit var progressBar: ProgressBar
    private lateinit var userName: String

    private lateinit var userNewPassword: TextInputLayout
    private lateinit var userConNewPassword: TextInputLayout
    var passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{8,}$"
    private val passwordPatterns: Pattern = Pattern.compile(passwordRegex)
    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
        userName = arguments?.getString("userName").toString()
        Log.i("item",userName)
        return activity?.let {
            val builder = AlertDialog.Builder(it)
            userNewPassword = dialog?.findViewById(R.id.newPasswordDialog)!!
            userConNewPassword = dialog?.findViewById(R.id.confirmNewPasswordDialog)!!
            val inflater = requireActivity().layoutInflater
            builder.setView(inflater.inflate(R.layout.change_password_dialog, null))

                    .setPositiveButton(R.string.submit,
                            DialogInterface.OnClickListener { dialog, id ->
                                changePassword(userNewPassword?.editText?.text.toString().trim(),userConNewPassword?.editText?.text.toString().trim())
                            })
                    .setNegativeButton(R.string.cancel,
                            DialogInterface.OnClickListener { dialog, id ->
                                getDialog()?.cancel()
                            })
            builder.create()
        } ?: throw IllegalStateException("Activity cannot be null")
    }


    private fun changePassword(newPassword: String, conNewPassword: String){
        if(newPassword.isEmpty()){
            userNewPassword?.error = "New Password Required if you want to change"
            userNewPassword?.requestFocus()
            return
        }
        else{
            userNewPassword?.error = ""
        }
        if(!passwordPatterns.matcher(newPassword).matches()){
            userNewPassword?.error = "The password format is Invalid"
            userNewPassword?.requestFocus()
            return
        }
        else{
            userNewPassword?.error = ""
        }
        if(conNewPassword.isEmpty()){
            userConNewPassword?.error = "New Password Required if you want to change"
            userConNewPassword?.requestFocus()
            return
        }
        else{
            userConNewPassword?.error = ""
        }
        if(newPassword != conNewPassword){
            userConNewPassword?.error = "Password Doesn't match"
            userConNewPassword?.requestFocus()
            return
        }
        else{
            userConNewPassword?.error = ""
        }

        progressBar.visibility = View.VISIBLE
    }
}