Conditions :   
   CreateProdResources : !Equals [!Ref EnvType, prod ]   
   
And, Equals, If, Not Or   
   
lntristic Functions   
   
YAML !Ref   
  
GetAtt   
  
Resources :  
 EC2Instances :  
   Type : "AWS::EC2::Instance"  
   Properties :  
           ImageId : ami-1234567  
               InstanceType : t2.micro  
  
NewVolume :  
   Type : "AWS::EC2::Volume"  
   Condition : createProdResources  
   Properties :  
      Size : 100  
      AvailabilityZone :  
        !GetAtt EC2Instance.AvailabilityZone  
  

FindInMap  

  
ImportValue  
  
Resources :   
   MySecureInstance :  
      Type :  
      Properties :  
        AvailabilityZone : us-east-1a  
        ImageId : ami-a4c7edb2  
        InstanceType : t2.micro  
        SecurityGroups :   
          - !ImportValue SSHSecurityGroup  
  
!Join { ":" , [a,b,c] }  
  
Sub  
  
!Sub String  

