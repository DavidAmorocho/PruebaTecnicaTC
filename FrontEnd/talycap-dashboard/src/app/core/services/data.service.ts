import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Serie } from '../models/show.model';

@Injectable({
    providedIn: 'root'
})
export class ServicioDatos {
    private http = inject(HttpClient);
    private readonly URL_API_TMBD = 'https://api.tvmaze.com';

    /**
     * Obtiene una lista grande de series de TV desde el índice principal.
     */
    obtenerSeries(): Observable<Serie[]> {
        return this.http.get<Serie[]>(`${this.URL_API_TMBD}/shows`);
    }
}
