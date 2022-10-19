import wandb

# this is a key for my public account 
wandb.login(key="3dbab9409a8508ef6618bd9c199a164f94743b3d")

# Assumes finetune_sweep is already created and initialized
# To create run -> wandb sweep toy_sweep.yaml --project=toy

sweep_id = "ppggk4vv" 

if __name__ == '__main__':
    # Create TPU and setup requirements
    wandb.agent(sweep_id, project='toy', count=1, entity='toy_entity')