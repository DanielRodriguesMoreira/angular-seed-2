#!/bin/bash

# Set variables for the new account, database, and collection
resourceGroupName='rg-iam-dev'
location='westeurope'
name='docdb-test2'
databaseName='docdb-test2-database'
collectionName='docdb-test2-collection'

# Create a DocumentDB API Cosmos DB account
az cosmosdb create \
	--name $name \
	--kind GlobalDocumentDB \
	--resource-group $resourceGroupName \
	--max-interval 10 \
	--max-staleness-prefix 200

# Create a database
az cosmosdb database create \
	--name $name \
	--db-name $databaseName \
	--resource-group $resourceGroupName

# Create a collection
az cosmosdb collection create \
	--collection-name $collectionName \
	--name $name \
	--db-name $databaseName \
	--resource-group $resourceGroupName
