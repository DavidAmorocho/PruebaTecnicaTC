export interface ImagenSerie {
  medium: string;
  original: string;
}

export interface CalificacionSerie {
  average: number | null;
}

export interface Serie {
  id: number;
  name: string;
  type: string;
  language: string;
  genres: string[];
  status: string;
  premiered: string;
  rating: CalificacionSerie;
  image: ImagenSerie | null;
  summary: string;
}
