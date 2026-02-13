import { List, Action, ActionPanel, showToast, Toast } from "@raycast/api"

export default function Command() {
  return (
    <List>
      <List.Item
        title="⚡ Quick Deploy"
        subtitle="Deploy your app instantly"
        actions={
          <ActionPanel>
            <Action title="Deploy" onAction={() => showToast({ style: Toast.Style.Success, title: "Deployed!" })} />
          </ActionPanel>
        }
      />
      <List.Item title="📊 Analytics" subtitle="View stats" />
      <List.Item title="📦 Deployments" subtitle="List all" />
    </List>
  )
}
