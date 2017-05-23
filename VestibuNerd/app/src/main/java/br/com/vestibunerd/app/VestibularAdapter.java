package br.com.vestibunerd.app;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;

import java.util.List;

/**
 * Created by 16165847 on 09/05/2017.
 */

public class VestibularAdapter extends ArrayAdapter<Vestibular> {

    int resource;

    public VestibularAdapter(Context context, int resource, List<Vestibular> objects) {
        super(context, resource, objects);
        this.resource = resource;
    }
    
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        View v = convertView;
        if (v == null) {
            v = LayoutInflater.from(getContext())
                    .inflate(resource, null);
        }
        Vestibular vestibular = getItem(position);

        ImageView img_vestibular = (ImageView) v.findViewById(R.id.img_item_vestibular);

        img_vestibular.setImageResource(vestibular.getImagem());

        return v;
    }
}