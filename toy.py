import jax
import wandb

def main():
    wandb.init(resume='allow')
    print(len(jax.devices()))
    wandb.log({'score': 10}) 

if __name__ == '__main__':
    main()

