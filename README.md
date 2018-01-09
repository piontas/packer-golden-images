# packer-golden-images
Examples how to use Packer to build Linux and Windows golden images.

## Installing requirements

Download and install packer binaries (https://www.packer.io/downloads.html)

Install required packages for all demos:

    pip install -r requirements.txt
    
## Examples

### Simple Linux example with amazon-ebs builder

    export AWS_PROFILE=YOUR_AWS_PROFILE AWS_REGION=eu-west-1 && packer build packer/linux_aws_shell.json
    
### Simple Linux example with amazon-ebs builder and ansible provisioner

    export AWS_PROFILE=YOUR_AWS_PROFILE AWS_REGION=eu-west-1 && ./build_image.sh linux_aws_ansible
    
### Deploying CodePipeline

    export AWS_PROFILE=YOUR_AWS_PROFILE AWS_REGION=eu-west-1 && ./pipeline/deploy_pipeline.sh
