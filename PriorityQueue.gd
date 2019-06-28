# Written by Nevarek
# Written using Godot v3.1.stable.official
# 
# Description: A simple priority queue that can store variant data


class_name PriorityQueue

# Simple subclass to hold the queued queue data and priority
class QueueItem:
	var data
	var priority : float

	func _init(data, priority : float) -> void:
		self.data = data
		self.priority = priority

var queue : Array

func _init():
	self.queue = Array()

# add data to queue with a given priority
func enqueue(data, priority : float) -> void:
	var new_item = QueueItem.new(data, priority)

	for i in range(queue.size()):
		# if the new item has a lower priority, it goes first
		if self.queue[i].priority > new_item.priority:
			self.queue.insert(i, new_item)
			return

	# we can assume new element has the highest priority, just append
	self.queue.append(new_item)

# removes first item
func dequeue():
	if self.empty() == true:
		# print_debug('Cannot dequeue: queue is empty')
		return null

	return self.queue.pop_front().data

# remove last item
func dequeue_back():
	if self.empty() == true:
		# print_debug('Cannot dequeue back: queue is empty')
		return null
	return self.queue.pop_back().data

# returns the front item, but doesn't remove it from the queue
func front():
	if self.empty() == true:
		# print_debug('No elements are in queue')
		return null

	return self.queue.front().data

# returns the last item, but doesn't remove it from the queue
func back():
	if self.empty() == true:
		# print_debug('No elements are in queue')
		return null

	return self.queue.back().data

# returns whether or not the queue is empty
func empty() -> bool:
	return self.queue.size() == 0

# returns the number of items in the queue
func size() -> int:
	return self.queue.size()