import {
  Component,
  Input,
  OnChanges,
  SimpleChanges,
  ViewChild,
  AfterViewInit
} from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatIconModule } from '@angular/material/icon';

export interface DefinicionColumna {
  clave: string;
  encabezado: string;
  tipo?: 'texto' | 'imagen' | 'fecha' | 'numero';
}

@Component({
  selector: 'app-data-table',
  standalone: true,
  imports: [
    CommonModule,
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    MatFormFieldModule,
    MatInputModule,
    MatIconModule
  ],
  templateUrl: './data-table.component.html',
  styleUrls: ['./data-table.component.scss']
})
export class DataTableComponent<T> implements OnChanges, AfterViewInit {
  @Input() datos: T[] = [];
  @Input() columnas: DefinicionColumna[] = [];

  fuenteDatos = new MatTableDataSource<T>([]);
  columnasMostradas: string[] = [];

  @ViewChild(MatPaginator) paginador!: MatPaginator;
  @ViewChild(MatSort) ordenamiento!: MatSort;

  ngOnChanges(cambios: SimpleChanges): void {
    if (cambios['datos'] && this.datos) {
      this.fuenteDatos.data = this.datos;
    }
    if (cambios['columnas'] && this.columnas) {
      this.columnasMostradas = this.columnas.map(c => c.clave);
    }
  }

  ngAfterViewInit(): void {
    this.fuenteDatos.paginator = this.paginador;
    this.fuenteDatos.sort = this.ordenamiento;
  }

  aplicarFiltro(evento: Event) {
    const valorFiltro = (evento.target as HTMLInputElement).value;
    this.fuenteDatos.filter = valorFiltro.trim().toLowerCase();

    if (this.fuenteDatos.paginator) {
      this.fuenteDatos.paginator.firstPage();
    }
  }

  obtenerValorCelda(fila: any, columna: DefinicionColumna): any {
    const claves = columna.clave.split('.');
    let valor = fila;
    for (const clave of claves) {
      if (valor == null) return null;
      valor = valor[clave];
    }
    return valor;
  }
}
