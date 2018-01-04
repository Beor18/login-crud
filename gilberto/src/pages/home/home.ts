import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';
import {Http} from '@angular/http';
import 'rxjs/add/operator/map';


@Component({
  selector: 'page-home',
  templateUrl: 'home.html',
})
export class HomePage{
  posts = [];
  filteredMuseum = [];
  isfiltered: boolean ;

  constructor(private http:Http, public navCtrl: NavController, public navParams: NavParams) {
    this.http.get('http://localhost:4000/v1/posts')
        .map(res => res.json())
        .subscribe(data => {
            this.posts = data.data;
          },
          err => console.log("error is "+err), // error
          () => console.log('data de telos completa'+ this.posts) // complete
        );
    
  }



}

