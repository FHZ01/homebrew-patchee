package aws

import (
    "context"
    "github.com/aws/aws-sdk-go-v2/config"
    "github.com/aws/aws-sdk-go-v2/service/ec2"
)

func getSession() *ec2.Client {
    cfg, err := config.LoadDefaultConfig(context.TODO(),
        config.WithSharedConfigProfile("default"), // Uses default profile from ~/.aws/credentials
        config.WithRegion("eu-west-2"),           // Default region, can be made configurable
    )
    if err != nil {
        panic("unable to load SDK config: " + err.Error())
    }

    return ec2.NewFromConfig(cfg)
}

// Add configuration options
type Config struct {
    Profile string
    Region  string
}

func NewSessionWithConfig(cfg Config) *ec2.Client {
    awsCfg, err := config.LoadDefaultConfig(context.TODO(),
        config.WithSharedConfigProfile(cfg.Profile),
        config.WithRegion(cfg.Region),
    )
    if err != nil {
        panic("unable to load SDK config: " + err.Error())
    }

    return ec2.NewFromConfig(awsCfg)
}
