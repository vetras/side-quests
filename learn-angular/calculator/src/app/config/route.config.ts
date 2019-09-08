import { Routes } from "@angular/router";
import { CalculatorPageComponent } from "../pages/calculator/calculator.component";

export const ROUTE: Routes = [
    {
        path: "calculator",
        component: CalculatorPageComponent
    },
    {
        // redirect the home page to intro
        path: "",
        redirectTo: "calculator",
        pathMatch: "full"
    },
    {
        // redirect all unknown paths the home page to intro
        // could be a 404 page, if we wrote the html for it :)
        path: "**",
        redirectTo: "calculator",
        pathMatch: "full"
    }
];
