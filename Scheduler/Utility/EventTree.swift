//
//  EventTree.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import Foundation

// MARK: EventNode
class EventNode {
    // Event model
    let event: Event
    // startTime value of Event model
    let value: Date
    var leftNode: EventNode?
    var rightNode: EventNode?
    init(event: Event) {
        self.event = event
        self.value = event.startTime
    }
}


// MARK: EventTree
class EventTree {
    // Output: sorted Event array
    var sortedEvents: [Event] = []
    init(events: [Event]) {
        guard let rootNode = generateBinaryTree(events: events) else {
            return
        }
        inOrderTraversal(rootNode: rootNode, visit: { (eventNode) in
            sortedEvents.append(eventNode.event)
        })
        
    }
    
    /// generateBinaryTree method takes an array of event and generate Binary Tree and return new root node.
    /// FYI : This binary tree can have duplicate values in that case it will accommodate duplicate value as left node.
    ///  Time Complexity: O(n log n)
    /// - Parameters:
    ///     - events: [Event]
    /// - Returns: EventNode?
    private func generateBinaryTree(events: [Event]) -> EventNode? {
        guard let firstEvent = events.first else {
            return nil
        }
        var rootNode = EventNode(event: firstEvent)
        for index in 1..<events.count {
            rootNode = insertElement(rootNode: rootNode, newEvent: events[index])
        }
        return rootNode
    }
    
    /// insertElement method takes root node and new event tobe inserted an returns updated rootNode.
    /// FYI : This binary tree can have duplicate values in that case it will accommodate duplicate value as left node.
    /// TimeComplexity: O(logn)
    /// - Parameters:
    ///     - rootNode: EventNode
    ///     - newEvent: Event
    /// - Returns: EventNode
    private func insertElement(rootNode: EventNode, newEvent: Event) -> EventNode {
        let newNode = EventNode(event: newEvent)
        var currentNode: EventNode? = rootNode
        while currentNode != nil {
            guard let currentNodeValue = currentNode?.value else {
                return rootNode
            }
            if newNode.value <= currentNodeValue {
                guard let leftNode = currentNode?.leftNode else {
                    currentNode?.leftNode = newNode
                    return rootNode
                }
                currentNode = leftNode
            }
            if newNode.value > currentNodeValue {
                guard let rightNode = currentNode?.rightNode else {
                    currentNode?.rightNode = newNode
                    return rootNode
                }
                currentNode = rightNode
            }
        }
        return rootNode
    }
    
    /// Tracerse through binary tree and generate sorted array of events
    /// TimeComplexity: O(n)
    /// - Parameters:
    ///     - rootNode: EventNode
    /// - Returns: block that returns sorted events
    private func inOrderTraversal(rootNode: EventNode, visit:(EventNode) -> Void) {
        if let leftNode = rootNode.leftNode {
            inOrderTraversal(rootNode: leftNode, visit: visit)
        }
        visit(rootNode)
        if let rightNode = rootNode.rightNode {
            inOrderTraversal(rootNode: rightNode, visit: visit)
        }
    }
}
