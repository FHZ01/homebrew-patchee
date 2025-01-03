package aws

import (
    "fmt"
    "github.com/aws/aws-sdk-go-v2/service/ec2"
    "strings"
)

func SearchInstances(namePattern string) ([]*ec2.Instance, error) {
    svc := ec2.New(getSession())
    
    input := &ec2.DescribeInstancesInput{
        Filters: []ec2.Filter{
            {
                Name: aws.String("tag:Name"),
                Values: []*string{
                    aws.String(fmt.Sprintf("*%s*", namePattern)),
                },
            },
        },
    }
    
    result, err := svc.DescribeInstances(input)
    if err != nil {
        return nil, err
    }
    
    var instances []*ec2.Instance
    for _, reservation := range result.Reservations {
        instances = append(instances, reservation.Instances...)
    }
    
    return instances, nil
}
