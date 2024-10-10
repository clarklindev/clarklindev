# Define variables
$githubUsername = ""          # Replace with the GitHub username
$token = ""          # Replace with your GitHub PAT

# Fetch all repositories
$response = Invoke-RestMethod -Uri "https://api.github.com/users/$githubUsername/repos?per_page=100" -Headers @{
    Authorization = "token $token"
    Accept = "application/vnd.github.v3+json"
} -Method Get

# Clone each repository
foreach ($repo in $response) {
    git clone $repo.clone_url
}
