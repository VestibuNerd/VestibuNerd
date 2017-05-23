package br.com.vestibunerd.app;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class VestibularActivity extends AppCompatActivity {

    ListView list_view_vestibular;
    List<Vestibular> lstVestibular = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_vestibular);

        list_view_vestibular = (ListView) findViewById(R.id.list_view_vestibular);

        VestibularAdapter adapter = new VestibularAdapter(
                this, //contexto
                R.layout.list_view_item_vestibular,
                lstVestibular
        );
        list_view_vestibular.setAdapter(adapter);
    }
}