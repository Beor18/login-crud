import { Component } from '@angular/core';
import { NavController, Platform } from 'ionic-angular';
import { Geolocation } from '@ionic-native/geolocation';

declare var google: any;

@Component({
  selector: 'page-about',
  templateUrl: 'about.html'
})
export class AboutPage {

  map: any;
  markers:any;

  lugares = [
  {
    nombre: 'lugar1',
    lugar: 'Nombre-lugar',
    latitude: -15.5837031,
    longitude: -56.084949
  },
  {
    nombre: 'lugar2',
    lugar: 'Nombre-lugar',
    latitude: -15.574358,
    longitude: -56.0880802
}];

  constructor(public navCtrl: NavController, public geolocation: Geolocation, public platform:Platform) {

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
