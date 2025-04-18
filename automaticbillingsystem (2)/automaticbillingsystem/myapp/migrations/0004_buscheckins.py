# Generated by Django 3.2.25 on 2025-01-16 14:02

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0003_wallet'),
    ]

    operations = [
        migrations.CreateModel(
            name='buscheckins',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=datetime.datetime(2025, 1, 16, 9, 2, 20, 608824))),
                ('checkinstatus', models.CharField(max_length=40)),
                ('checkoutstatus', models.CharField(max_length=40)),
                ('checkintime', models.TimeField()),
                ('checkouttime', models.TimeField()),
                ('ROUTPOINT1', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='a', to='myapp.route_point')),
                ('ROUTPOINT2', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='b', to='myapp.route_point')),
                ('USER', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.user')),
                ('VEHICLE', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.vehicle')),
            ],
        ),
    ]
