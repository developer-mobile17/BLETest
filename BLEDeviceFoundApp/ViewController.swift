//
//  ViewController.swift
//  BLEDeviceFoundApp
//
//  Created by wbmb on 21/06/21.
//

import UIKit
import CoreBluetooth



class ViewController: UIViewController,CBCentralManagerDelegate,CBPeripheralDelegate {
    
    var centralManger: CBCentralManager!
    var myPeriPheral: CBPeripheral!
    
   // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManger = CBCentralManager(delegate: self, queue: nil)
    }

    
    // MARK: -
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
            if central.state == CBManagerState.poweredOn {
                print("BLE powered on")
                // Turned on
            }
            else {
                print("Something wrong with BLE")
                // Not on, but can have different issues
            }
        }
    
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if let pname = peripheral.name {
            if pname == "Nordic_HRM"{
                self.centralManger.stopScan()                
                self.myPeriPheral = peripheral
                self.myPeriPheral.delegate = self
                self.centralManger.connect(peripheral, options: nil)
            }
        }
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        self.myPeriPheral.discoverServices(nil)
    }
    
    
    func testGitBranchCode() {
        print("name SWIFT RXSWIFT IOSfdgnmgbkjd")
    }
    
    
    // test name is vikas new git test by me
    
    // adsflkdsjfaslkdflkadslkjflkadslf
    //jlkafjsdlkfjlkasjflkjalsd
    
    
    
    
    
    
}



/*
 
 
 CoreBluetooth main classes & Protocol
  
 CBCentralManager & CBCentralManagerDelegate
 Are responsible to check that Bluetooth is ON and then to scan, discover, connect, and manage peripherals.
 
 
 CBPeripheral & CBPeripheralDelegate
 Represents physical BLE devices as they were discovered by CBCentralManager. They are identified by UUID (universally unique identifier) which contains one or more services.
 
 
 CBService
 Represents service physical BLE device, and provide data associated behaviors and characteristics given BLE-device.
 
 
 CBCharacteristics
 Represent the data of the device’s service and contains a single value. Here is where we can read, write, and subscribe to the data from the device (ex: battery level, temperature, LED light).
 
 
 */
