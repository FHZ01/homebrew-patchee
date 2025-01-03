package main

import (
    "fmt"
    "os"
    "github.com/spf13/cobra"
    "github.com/FHZ01/patchee/internal/aws"
    "github.com/FHZ01/patchee/internal/ssh"
)

func main() {
    var rootCmd = &cobra.Command{Use: "patchee"}
    
    var searchCmd = &cobra.Command{
        Use:   "search ",
        Short: "Search EC2 instances by name",
        Args:  cobra.ExactArgs(1),
        Run: func(cmd *cobra.Command, args []string) {
            instances, err := aws.SearchInstances(args[0])
            if err != nil {
                fmt.Fprintf(os.Stderr, "Error: %v\n", err)
                os.Exit(1)
            }
            for _, inst := range instances {
                fmt.Printf("%s\t%s\n", *inst.InstanceId, *inst.Tags[0].Value)
            }
        },
    }

    var connCmd = &cobra.Command{
        Use:   "conn ",
        Short: "Connect to EC2 instance via SSH",
        Args:  cobra.ExactArgs(1),
        Run: func(cmd *cobra.Command, args []string) {
            instanceID, err := aws.GetInstanceID(args[0])
            if err != nil {
                fmt.Fprintf(os.Stderr, "Error: %v\n", err)
                os.Exit(1)
            }
            err = ssh.Connect(instanceID)
            if err != nil {
                fmt.Fprintf(os.Stderr, "Error: %v\n", err)
                os.Exit(1)
            }
        },
    }

    rootCmd.AddCommand(searchCmd, connCmd)
    rootCmd.Execute()
