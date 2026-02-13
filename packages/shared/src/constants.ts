/**
 * BlackRoad OS global constants
 */

export const BLACKROAD_VERSION = '1.0.0'

export const DOMAINS = {
  MAIN: 'blackroad.io',
  LUCIDIA: 'lucidia.earth',
  ROADCHAIN: 'roadchain.io',
  ALICE: 'aliceqi.com',
} as const

export const SERVICES = {
  WEB: 'blackroad-os-web',
  API: 'blackroad-os-api',
  PRISM: 'blackroad-os-prism-console',
  AUTH: 'blackroad-os-auth',
} as const

export const AGENT_LIMITS = {
  CURRENT: 1000,
  TARGET_1: 30_000,
  TARGET_2: 1_000_000,
  TARGET_3: 30_000_000_000,
} as const
