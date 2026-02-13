/**
 * Base Agent class for BlackRoad OS
 */

export interface AgentConfig {
  id: string
  name: string
  description: string
  capabilities: string[]
  tier: 1 | 2 | 3
  model?: string
  temperature?: number
}

export interface AgentMessage {
  role: 'system' | 'user' | 'assistant'
  content: string
  timestamp: number
}

export abstract class Agent {
  protected config: AgentConfig
  protected memory: AgentMessage[] = []

  constructor(config: AgentConfig) {
    this.config = config
  }

  abstract execute(input: string): Promise<string>

  getId(): string {
    return this.config.id
  }

  getName(): string {
    return this.config.name
  }

  getCapabilities(): string[] {
    return this.config.capabilities
  }

  addMessage(message: AgentMessage): void {
    this.memory.push(message)
  }

  getMemory(): AgentMessage[] {
    return this.memory
  }

  clearMemory(): void {
    this.memory = []
  }
}
