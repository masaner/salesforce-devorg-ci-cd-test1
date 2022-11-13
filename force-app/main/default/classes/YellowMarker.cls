// Extension for the Marker class
public class YellowMarker extends Marker {
    public override void write() {
        Double value1 = discount();
        System.debug(value1);
        Double value2 = discount();
        System.debug(value2);
        hello();
        System.debug('Writing some text using the yellow marker VAL: ' + value1);
    }
        
    public override Double discount() {
        return .09;
    }
}