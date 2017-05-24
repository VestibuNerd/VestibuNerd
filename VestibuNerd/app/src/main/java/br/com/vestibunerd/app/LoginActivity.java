package br.com.vestibunerd.app;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.SystemClock;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.google.gson.Gson;

import org.apache.http.params.HttpConnectionParams;

public class LoginActivity extends AppCompatActivity {

    Context context;
    String apelido;
    String senha;
    String teste;
    EditText edit_text_apelido,edit_text_senha;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        context = this;

        edit_text_apelido = (EditText) findViewById(R.id.edit_apelido);
        edit_text_senha = (EditText) findViewById(R.id.edit_senha);
    }

    public void abrirTelaPrincipal(View view) {


        Intent intent = new Intent(context,HomeActivity.class);
        startActivity(intent);
    }

    private class EfetuaLoginTask extends AsyncTask<Void,Void,Void>{

        String retornoVestibulandoJson;
        ProgressDialog progress;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();

            progress= ProgressDialog.show(
                    context,
                    "Efetuando login",
                    "Procurando usuário...");
        }

        @Override
        protected Void doInBackground(Void... params) {

            SystemClock.sleep(1000);
            String link = String.format("http://10.107.134.14/20171sem/Projeto%20Vestibunerd/autentica.php?apelido="+apelido+"&senha="+senha);
            retornoVestibulandoJson = HttpConnection.get(link);
            Log.d("doInBackground", retornoVestibulandoJson);
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);

            progress.dismiss();

            Gson gson = new Gson();
            Vestibulando vestibulando = gson.fromJson(retornoVestibulandoJson, Vestibulando.class);

            String opa;
            opa = vestibulando.getApelido();

            Toast.makeText(context, opa, Toast.LENGTH_SHORT).show();

            //TODO: Criar Classe Para o Vestibulando
            //TODO: TERMINAR OnPostExecute

        }
    }


}
