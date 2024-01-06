import { LightningElement, api } from 'lwc';

export default class flowToLWC extends LightningElement {
    @api optionFromFlow;
    @api responseFromLWC;

    connectedCallback(){
        if(this.optionFromFlow == 'A'){
            this.responseFromLWC = 'First value was selected in the flow!';
        }
        else if(this.optionFromFlow == 'B'){
            this.responseFromLWC = 'Second value was selected in the flow!';
        }
        else if(this.optionFromFlow == 'C'){
            this.responseFromLWC = 'Third value was selected in the flow!';
        }
    }
    
}
