import { Directive } from '@angular/core';
import { AbstractControl, NG_VALIDATORS, ValidationErrors } from "@angular/forms";

@Directive({
  selector: '[numeroNegativoValidator]',
  providers: [{
    provide: NG_VALIDATORS,
    useExisting: ValidaNumeroNegativoDirective,
    multi: true
  }]
})
export class ValidaNumeroNegativoDirective {

  constructor() { }

  registerOnValidatorChange(fn: () => void): void {
  }

  validate(control: AbstractControl): ValidationErrors | null {
    const numero = control.value;

    if(numero <= 0) {
      return {'numeroNegativoValidator': true};
    }
    return null;
  }

}
