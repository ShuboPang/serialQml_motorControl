import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Particles 2.0

Rectangle {
    visible: true;
    anchors.fill: parent
//    width: 760;
//    height: 615;
    color: "lightblue";
    id: root;

    Rectangle {
        id: target;
        color: "transparent";
        width: parent.width/2;
        height: 100;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.margins: 4;
    }

    ParticleSystem {
        id: particleSystem;
    }

    Emitter {
        id: emitter;
        system: particleSystem;

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: 40;
        height: 40;

        size: 20;
        endSize: 80;
        sizeVariation: 10;
        emitRate: 20;
        lifeSpan: 6400;
        lifeSpanVariation: 400;
//        velocity: TargetDirection {
//            targetItem: target;
//            targetX: target.width/2;
//            targetY: 0;
//            targetVariation: target.width/2;
//            magnitude: root.height/3;
//        }
        velocity: AngleDirection {
                    angle: 0
                    angleVariation: 15
                    magnitude: 100
                    magnitudeVariation: 50
                }
    }

    ImageParticle {
        system: particleSystem;
        source: "../image/popo.png";
    }
}

