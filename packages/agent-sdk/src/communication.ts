/**
 * NATS-based agent communication (pub/sub)
 */

export interface Message {
  topic: string
  payload: any
  sender: string
  timestamp: number
}

export interface Subscriber {
  unsubscribe(): void
}

export class AgentCommunication {
  private handlers: Map<string, ((message: Message) => void)[]> = new Map()

  /**
   * Publish message to topic
   */
  async publish(topic: string, payload: any, sender: string): Promise<void> {
    const message: Message = {
      topic,
      payload,
      sender,
      timestamp: Date.now(),
    }

    const handlers = this.handlers.get(topic) || []
    handlers.forEach(handler => handler(message))
  }

  /**
   * Subscribe to topic
   */
  subscribe(topic: string, handler: (message: Message) => void): Subscriber {
    if (!this.handlers.has(topic)) {
      this.handlers.set(topic, [])
    }

    this.handlers.get(topic)!.push(handler)

    return {
      unsubscribe: () => {
        const handlers = this.handlers.get(topic) || []
        const index = handlers.indexOf(handler)
        if (index > -1) {
          handlers.splice(index, 1)
        }
      },
    }
  }

  /**
   * Get all active topics
   */
  getTopics(): string[] {
    return Array.from(this.handlers.keys())
  }
}
