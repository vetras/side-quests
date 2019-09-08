import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { ROUTE } from './config/route.config';

import { AppComponent } from './app.component';
import { CalculatorPageComponent } from './pages/calculator/calculator.component';
import { NumericButtonComponent } from './components/numeric-button/numeric.component';

@NgModule({
  declarations: [
    AppComponent,
    CalculatorPageComponent,
    NumericButtonComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(ROUTE)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
