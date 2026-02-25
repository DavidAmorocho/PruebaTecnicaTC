import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ServicioDatos } from '../../core/services/data.service';
import { Serie } from '../../core/models/show.model';
import { DataTableComponent, DefinicionColumna } from './components/data-table/data-table.component';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [
    CommonModule,
    DataTableComponent,
    MatProgressSpinnerModule,
    MatSnackBarModule
  ],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  private servicioDatos = inject(ServicioDatos);
  private snackBar = inject(MatSnackBar);

  series: Serie[] = [];
  cargando = true;

  columnas: DefinicionColumna[] = [
    { clave: 'image.medium', encabezado: 'Cartel de cine', tipo: 'imagen' },
    { clave: 'name', encabezado: 'Título', tipo: 'texto' },
    { clave: 'premiered', encabezado: 'Fecha de Estreno', tipo: 'fecha' },
    { clave: 'rating.average', encabezado: 'Calificación', tipo: 'numero' }
  ];

  ngOnInit(): void {
    this.cargarSeries();
  }

  cargarSeries(): void {
    this.cargando = true;
    this.servicioDatos.obtenerSeries().subscribe({
      next: (datos) => {
        this.series = datos;
        this.cargando = false;
      },
      error: (err) => {
        this.cargando = false;
        this.snackBar.open('Hubo un error al cargar la informacion desde el API.', 'Cerrar', {
          duration: 5000,
          panelClass: ['error-snackbar']
        });
        console.error('Error obteniendo la informacion', err);
      }
    });
  }
}
