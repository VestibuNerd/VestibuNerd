package br.com.vestibunerd.app;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class HomeActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    Context context;
    ListView list_meus_livros;
    List<Livros> lstLivros = new ArrayList<>();
    ArrayAdapter<String> adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        context = this;
        list_meus_livros = (ListView) findViewById(R.id.list_meus_livros);

        lstLivros.add(new Livros(R.drawable.book));

       adapter = new ArrayAdapter(
                context,
                R.layout.list_view_meus_livros,
                lstLivros
        );


        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
    }






    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_fuvest) {

        }else if (id == R.id.nav_unesp) {

        } else if (id == R.id.nav_minhaconta) {

        } else if (id == R.id.nav_perguntasfrequentes) {

        } else if (id == R.id.nav_sobre) {

        }else if (id == R.id.nav_sair) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public void abrirTelaVestibular(MenuItem item) {

        Intent intent = new Intent(context, VestibularActivity.class);
        startActivity(intent);
    }

    public void abrirTelaMinhaConta(MenuItem item) {

        Intent intent = new Intent(context, MinhaContaActivity.class);
        startActivity(intent);
    }

    public void abrirTelaPerguntasFrequentes(MenuItem item) {

        Intent intent = new Intent (context, PerguntasFrequentesActivity.class);
        startActivity(intent);
    }

    public void abrirTelaSobre(MenuItem item) {

        Intent intent = new Intent(context, SobreActivity.class);
        startActivity(intent);
    }

    public void abrirTelaLogin(MenuItem item) {

        Intent intent = new Intent(context, LoginActivity.class);
        startActivity(intent);
    }
}
