import pygame

pygame.init()

win = pygame.display.set_mode((500,500))
pygame.display.set_caption("First Game")

x = 50
y = 50
width = 40
height = 60
vel = 2

run = True

while run:
    pygame.time.delay(17)

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            run = False

    keys = pygame.key.get_pressed()

    if keys[pygame.K_a]:
        x -= vel

    if keys[pygame.K_d]:
        x += vel

    if keys[pygame.K_w]:
        y -= vel

    if keys[pygame.K_s]:
        y += vel

    if keys[pygame.K_a] and keys[pygame.K_LSHIFT]:
      x -= vel

    if keys[pygame.K_d] and keys[pygame.K_LSHIFT]:
      x += vel

    if keys[pygame.K_w] and keys[pygame.K_LSHIFT]:
      y -= vel

    if keys[pygame.K_s] and keys[pygame.K_LSHIFT]:
      y += vel

    if keys[pygame.K_LEFT]:
        x -= vel

    if keys[pygame.K_RIGHT]:
        x += vel

    if keys[pygame.K_UP]:
        y -= vel

    if keys[pygame.K_DOWN]:
        y += vel

    if keys[pygame.K_LEFT] and keys[pygame.K_LSHIFT]:
      x -= vel

    if keys[pygame.K_RIGHT] and keys[pygame.K_LSHIFT]:
      x += vel

    if keys[pygame.K_UP] and keys[pygame.K_LSHIFT]:
      y -= vel

    if keys[pygame.K_DOWN] and keys[pygame.K_LSHIFT]:
      y += vel

    win.fill((250,150,150))  # Fills the screen with black
    pygame.draw.rect(win, (0,100,150), (x, y, width, height))   
    pygame.display.update() 
