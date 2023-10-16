export class PageRequest<T> {

  constructor(
    public content: T[],
    public last: boolean,
    public totalPages: number,
    public totalElements: number,
    public first: boolean,
    public size: number,
    public number: number,
    public numberOfElements: number,
    public empty: boolean
  ) {
  }

}
