import { LinearClient } from "@linear/sdk"
import axios from "axios"

const linear = new LinearClient({
  apiKey: process.env.LINEAR_API_KEY
})

const BLACKROAD_API_KEY = process.env.BLACKROAD_API_KEY
const PROJECT_ID = process.env.LINEAR_PROJECT_ID

// Create Linear issue for failed deployment
export async function createIssueForFailedDeployment(deployment: any) {
  try {
    const issue = await linear.issueCreate({
      teamId: process.env.LINEAR_TEAM_ID!,
      projectId: PROJECT_ID,
      title: `Deployment Failed: ${deployment.name}`,
      description: `
Deployment failed on BlackRoad.

**Details:**
- Deployment ID: ${deployment.id}
- Name: ${deployment.name}
- Status: ${deployment.status}
- Error: ${deployment.error || 'Unknown'}
- Time: ${new Date(deployment.updated_at).toLocaleString()}

**Actions:**
1. Check deployment logs
2. Review error messages
3. Fix and redeploy

[View in BlackRoad](https://blackroad.io/deployments/${deployment.id})
      `,
      priority: 1, // Urgent
      labels: ['deployment', 'bug']
    })
    
    console.log(`✅ Created Linear issue: ${issue.issue?.identifier}`)
    return issue
  } catch (error) {
    console.error('❌ Failed to create issue:', error)
  }
}

// Sync deployments to Linear project
export async function syncDeploymentsToLinear() {
  try {
    const response = await axios.get('https://api.blackroad.io/v1/deployments', {
      headers: { 'Authorization': `Bearer ${BLACKROAD_API_KEY}` }
    })
    
    const deployments = response.data.deployments
    
    for (const deployment of deployments) {
      // Create issue for each deployment
      await linear.issueCreate({
        teamId: process.env.LINEAR_TEAM_ID!,
        projectId: PROJECT_ID,
        title: `Deploy: ${deployment.name}`,
        description: `
**Deployment Details:**
- ID: ${deployment.id}
- URL: ${deployment.url}
- Status: ${deployment.status}
- Environment: ${deployment.environment || 'production'}

[View Dashboard](https://blackroad.io/deployments/${deployment.id})
        `,
        priority: deployment.status === 'failed' ? 1 : 3,
        labels: ['deployment'],
        state: deployment.status === 'active' ? 'done' : 'in_progress'
      })
    }
    
    console.log(`✅ Synced ${deployments.length} deployments to Linear`)
  } catch (error) {
    console.error('❌ Sync failed:', error)
  }
}

// Create deployment from Linear issue
export async function createDeploymentFromIssue(issueId: string) {
  try {
    const issue = await linear.issue(issueId)
    
    if (!issue) {
      throw new Error('Issue not found')
    }
    
    // Extract deployment info from issue title/description
    const name = issue.title.replace(/^Deploy:\s*/i, '')
    
    const response = await axios.post('https://api.blackroad.io/v1/deployments', {
      name,
      source: 'linear'
    }, {
      headers: {
        'Authorization': `Bearer ${BLACKROAD_API_KEY}`,
        'Content-Type': 'application/json'
      }
    })
    
    // Update Linear issue with deployment URL
    await linear.issueUpdate(issueId, {
      description: `${issue.description}\n\n**Deployed:** ${response.data.url}`
    })
    
    console.log('✅ Deployment created from Linear issue')
  } catch (error) {
    console.error('❌ Failed:', error)
  }
}

// Watch for failed deployments
setInterval(async () => {
  try {
    const response = await axios.get('https://api.blackroad.io/v1/deployments?status=failed', {
      headers: { 'Authorization': `Bearer ${BLACKROAD_API_KEY}` }
    })
    
    const failedDeployments = response.data.deployments
    
    for (const deployment of failedDeployments) {
      await createIssueForFailedDeployment(deployment)
    }
  } catch (error) {
    console.error('❌ Watch failed:', error)
  }
}, 300000) // Check every 5 minutes
