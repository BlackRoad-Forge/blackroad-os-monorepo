/**
 * PS-SHA∞ Memory System for agents
 */

import { createHash } from 'crypto'

export interface MemoryEntry {
  id: string
  timestamp: number
  data: any
  hash: string
  previousHash?: string
}

export class AgentMemory {
  private entries: MemoryEntry[] = []
  private lastHash?: string

  /**
   * Append entry to memory journal (append-only)
   */
  append(data: any): MemoryEntry {
    const entry: MemoryEntry = {
      id: this.generateId(),
      timestamp: Date.now(),
      data,
      hash: '',
      previousHash: this.lastHash,
    }

    entry.hash = this.computeHash(entry)
    this.entries.push(entry)
    this.lastHash = entry.hash

    return entry
  }

  /**
   * Query entries by predicate
   */
  query(predicate: (entry: MemoryEntry) => boolean): MemoryEntry[] {
    return this.entries.filter(predicate)
  }

  /**
   * Get all entries
   */
  getAll(): MemoryEntry[] {
    return [...this.entries]
  }

  /**
   * Verify integrity of memory chain
   */
  verify(): boolean {
    let previousHash: string | undefined

    for (const entry of this.entries) {
      if (entry.previousHash !== previousHash) {
        return false
      }

      const computedHash = this.computeHash(entry)
      if (entry.hash !== computedHash) {
        return false
      }

      previousHash = entry.hash
    }

    return true
  }

  private computeHash(entry: MemoryEntry): string {
    const data = JSON.stringify({
      id: entry.id,
      timestamp: entry.timestamp,
      data: entry.data,
      previousHash: entry.previousHash,
    })

    return createHash('sha256').update(data).digest('hex')
  }

  private generateId(): string {
    return Math.random().toString(36).substring(2, 15)
  }
}
