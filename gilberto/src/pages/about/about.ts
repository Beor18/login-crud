import { Component } from '@angular/core';
import { NavController, Platform } from 'ionic-angular';
import { Geolocation } from '@ionic-native/geolocation';
import {Http} from '@angular/http';

declare var google: any;

@Component({
  selector: 'page-about',
  templateUrl: 'about.html'
})
export class AboutPage {

  map: any;
  markers:any;

  lugares = [];

  constructor(private http:Http, public navCtrl: NavController, public geolocation: Geolocation, public platform:Platform) {
    this.http.get('http://demo-fernando.herokuapp.com/todos')
    .map(res => res.json())
    .subscribe(data => {
        this.lugares = data.museums;
      },
      err => console.log("error is "+err), // error
      () => console.log('data de lugares completa'+ this.lugares) // complete
    );
  }

  ionViewWillEnter(){
    this.platform.ready().then(() => {
      this.initMap();
    });
}

  initMap() {
    this.geolocation.getCurrentPosition().then(result => {
      this.loadMap(result.coords.latitude, result.coords.longitude);
    });
  }


  private loadMap(lat, lng) {
      let latLng = new google.maps.LatLng(lat, lng);

      let mapOptions = {
        center: latLng,
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
      };

      let element = document.getElementById('map');

      this.map = new google.maps.Map(element, mapOptions);
      let marker = new google.maps.Marker({
        position: latLng,
        title: 'Mi Posicion',
        icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
      })
      let content = `
      <div id="myid"  class="item item-thumbnail-left item-text-wrap">
        <ion-item>
          <ion-row>
            <h6>`+marker.title+`</h6>
          </ion-row>
        </ion-item>
      </div>
      `
      ;
      this.addInfoWindow(marker, content);
      marker.setMap(this.map);

      this.loadPoints();
    }

    loadPoints() {
      this.markers = [];

      for (const key of Object.keys(this.lugares)) {
        console.log(this.lugares[key].nombre )
        let latLng = new google.maps.LatLng(this.lugares[key].latitude, this.lugares[key].longitude);

        let marker = new google.maps.Marker({
          position: latLng,
          title: this.lugares[key].nombre
        })

        let content = `
        <div id="myid"  class="item item-thumbnail-left item-text-wrap">
          <ion-item>
            <ion-row>
              <h6>`+this.lugares[key].nombre+`</h6>
            </ion-row>
          </ion-item>
        </div>
        `
        ;
        this.addInfoWindow(marker, content);
        marker.setMap(this.map);
      }

      return this.markers;
    }

    addInfoWindow(marker, content) {
      let infoWindow = new google.maps.InfoWindow({
        content: content
      });

      google.maps.event.addListener(marker, 'click', () => {
        infoWindow.open(this.map, marker);

        google.maps.event.addListenerOnce(infoWindow, 'domready', () => {
          document.getElementById('myid').addEventListener('click', () => {
            this.goToEmpresa(marker)
          });
        });
      })
    }

    goToEmpresa(empresa) {
      alert('Click');
}

}
